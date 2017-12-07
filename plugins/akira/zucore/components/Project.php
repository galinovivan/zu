<?php namespace Akira\Zucore\Components;

use Backend\Models\User;
use Cms\Classes\ComponentBase;
use Illuminate\Support\Facades\Input;
use Akira\Zucore\Models\Project as ProjectModel;
use Exception;
use Flash;
use Validator;
use ValidationException;
use RainLab\User\Components\Account;
use RainLab\User\Models\User as UserModel;
use Illuminate\Support\Facades\DB;


class Project extends ComponentBase
{
    private $allowFileExtension = [
        'docx',
        'mp3',
        'mp4',
        'jpg',
        'png',
        'jpeg',
        'gif',
        'mpeg',
        '3gpp',
        'mpga'
    ];

    const YOUTUBE_URI = 'youtube.com';
    const ALTERNATIVE_YOUTUBE_URI = 'youtu.be';

    const AGE_GROUP = [
        'yang' => 1,
        'middle' => 2,
        'hight' => 3,
        'pizd' => 4
    ];

    public function componentDetails()
    {
        return [
            'name'        => 'Project Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties()
    {
        return [];
    }

    public function onRun()
    {
        $this->page['curr_uri'] = $_SERVER['REQUEST_URI'];
        if (isset($_GET['filter'])) {
            $this->page['filter'] = true;
            $this->page['nom_filter'] = $_GET['nomination'];
            $this->page['order_method'] = $_GET['order_method'];
        }
        $this->page['age_filter'] = isset($_GET['age']) ? $_GET['age'] : false;
    }

   



    public function getAgeGroupList()
    {
        return [
          [
              'label' => 'Начальная школа',
              'value' => 1
          ],
            [
                'label' => 'Средняя школа',
                'value' => 2
            ],
            [
                'label' => 'Старшая школа',
                'value' => 3
            ],
            [
                'label' => 'Дошкольники',
                'value' => 4
            ]
        ];
    }

    /**
     * @param $key
     * @return string
     */
    public function getModerationLabel($key)
    {
        $st = $this->getModerationStatus();
        return $st[$key];
    }
    public function getModerationStatus()
    {
        return [
            0 => 'На модерации',
            1 => 'Опубликован',
            -1 => 'Отклонена'
        ];
    }

    /**
     *
     */
    public function onProjectUpload()
    {
        try {
            $data = post();

            $rules = [
                'name' => 'required|between:1, 255',
                'nomination' => 'required',
            ];
            if (isset($data['group'])) {
                $data['group'] = (int) $data['group'];
            }
            $validation = Validator::make($data, $rules);

            if ($validation->fails()) {
                throw new ValidationException($validation);
            }
           
            if (!Input::hasFile('project_file') && $data['project_uri'] == '') {
                throw new Exception('Пожалуйста загрузите вашу работу');
            }

            $file = Input::file('project_file');
            if ($data['project_uri'] == '' && !$this->checkFileExtension($file)) {
                throw new Exception('Неверный формат файла');
            }

            if ($data['project_uri'] !== '') {
                $data['project_uri'] = $this->getValidVideoIdFromLink($data['project_uri']);
            }
            $project = ProjectModel::create($data);

            //save age group kostil(
            if ($data['group'] == Account::SCHOOL_GROUP) {
                $age = $this->getUserAge($project);
                $project->age_group = $this->getAgeGroup($age);

            }

            if (Input::hasFile('project_file')) {
            $project->project_file = $file;
            $project->save();
            }
            Flash::success('Ваш проект успешно добавлен!');
        } catch (Exception $e) {
            Flash::error($e->getMessage());
        }



    }


    public function getSchoolProject()
    {
        if (isset ($_GET['filter']) && $_GET['filter'] == 'true') {
            return $this->filterProject();
        }
        $filterAge = isset($_GET['age']) ? $_GET['age'] : false;



        $projects =  ProjectModel::where('group', 1)->where('moderation', 1);

        if ($filterAge) {
            $projects = $projects->where('age_group', (int) $filterAge);
        }
        return $projects->orderBy('created_at', 'desc')->paginate(12)->appends([
            'age' => $filterAge
        ]);
    }

    public function getStudentsProject()
    {
        if (isset ($_GET['filter']) && $_GET['filter'] == 'true') {
            return $this->filterProject();
        }



        $projects =  ProjectModel::where('group', 2)->where('moderation', 1);
        return $projects->orderBy('created_at', 'desc')->paginate(12);
    }

    public function filterProject()
    {
        $filterAge = isset($_GET['age']) ? $_GET['age'] : false;
        $group = $_GET['group'];
        $filter = $_GET['filter'];
        $nomination = $_GET['nomination'];
        $order = isset($_GET['order']) ? $_GET['order'] : 'desc';
        $orderMethod = isset($_GET['order_method']) ? $_GET['order_method'] : 'akira_zucore_projects.created_at';
        $projects = ProjectModel::where('group', $group)->where('moderation', 1);

        if ($nomination) {
            $projects = $projects->where('nomination', $nomination);    
        }
        if ($filterAge) {
            $projects = $projects->where('age_group', (int) $filterAge);
        }

         $projects = $projects->orderBy($orderMethod, $order)->paginate(12)
        ->appends([
            'group' => $group,
            'nomination' => $nomination,
            'order' => $order,
            'filter' => $filter,
            'age' => $filterAge,
            'order_method' => $orderMethod
        ]);

        // if ($ageFilter) {
        //     $projects = $this->filterByAge($projects, $ageFilter);
        // }
        return $projects;


    }

   public function remasteredProject()
   {
        $projects = ProjectModel::where('group', 1)->where('moderation', 1)->get();
        foreach ($projects as $project) {
            $age = (int) $this->getUserAge($project);
            if ($age != 0 && $age <= 6) {
                $project->age_group = 4;
                $project->save();
            }
        }   
   }


    private function getAgeGroup($age)
    {
        $group = 0;
        if ($age >= 7 && $age <= 9) {
            $group = 1;
        } elseif ($age >= 10 && $age <= 13) {
            $group = 2;
        } elseif ($age >= 14 && $age <= 17) {
            $group = 3;
        } elseif ($age >= 3 && $age <= 6) {
            $group = 4;
        }

        return $group;
    }




     private function getUserAge(ProjectModel $project)
     {
        $userDate = new \DateTime($project->user->date_of_bithday);
        $currDate = new \DateTime();
        $age = $currDate->diff($userDate);
        $age = $age->format('%y');
        return $age;

     }
    public function getFileType($filePath)
    {
        return filetype($filePath);
    }
    /**
     * @param $file
     * @return bool
     */
    public function checkFileExtension($file)
    {
        $allowExtension = $this->getAllowFileExtension();

        return in_array($file->extension(), $allowExtension );

    }

    /**
     * @return mixed
     */
    public function getAllowFileExtension()
    {
        return $this->allowFileExtension;
    }

    /**
     * @param $key
     * @return mixed
     */
    public function getNominationLabel($key)
    {
        $nominations = $this->nominationOnAllowFormat();

        return $nominations[$key];
    }

    /**
     * @return array
     */
    private function nominationOnAllowFormat()
    {
        return [
          'dance' => 'Танец',
          'vocal' => 'Вокал',
          'music' => 'Музыка',
          'art' => 'ИЗО/ДПИ',
          'litres' => 'Литература',
          'photo' => 'Фотография',
          'theart' => 'Театр',
          'video' => 'Видеотворчество',
          'original' => 'Оригинальный жанр',
          'child' => 'Дошкольники'
        ];
    }
    /**
     * @return array
     */
    public function getNomination($group)
    {
        $schoolNom = [
            [
                'label' => 'Танец',
                'value' => 'dance'
            ],
            [
                'label' => 'Вокал',
                'value' => 'vocal'
            ],
            [
                'label' => 'Музыка',
                'value' => 'music'
            ],
            [
                'label' => 'ИЗО/ДПИ',
                'value' => 'art'
            ],
            [
            	'label' => 'Литература',
            	'value' => 'litres'
            ],
            [
                'label' => 'Фотография',
                'value' => 'photo'
            ],
            [
                'label' => 'Театр',
                'value' => 'theart'
            ],
            [
                'label' => 'Видеотворчество',
                'value' => 'video'
            ],
            [
                'label' => 'Оригинальный жанр',
                'value' => 'original'
            ],
            [
                'label' => 'Дошколята',
                'value' => 'child'
            ]
        ];

        $studentNom = [
            [
                'label' => 'Танец',
                'value' => 'dance'
            ],
            [
                'label' => 'Вокал',
                'value' => 'vocal'
            ],
            [
                'label' => 'Музыка',
                'value' => 'music'
            ],
            [
                'label' => 'ИЗО/ДПИ',
                'value' => 'art'
            ],
            [
            	'label' => 'Литература',
            	'value' => 'litres'
            ],
            [
                'label' => 'Фотография',
                'value' => 'photo'
            ],
            [
                'label' => 'Театр',
                'value' => 'theart'
            ],
            [
                'label' => 'Видеотворчество',
                'value' => 'video'
            ],
            [
                'label' => 'Оригинальный жанр',
                'value' => 'original'
            ]
        ];

        return $group == Account::SCHOOL_GROUP ? $schoolNom : $studentNom;
    }

        
    private function getValidVideoIdFromLink($uri)
    {
        if (stripos($uri, self::YOUTUBE_URI) !== false || stripos($uri, self::ALTERNATIVE_YOUTUBE_URI)) {
            return $this->getYoutubeVideoLink($uri);
        } else {
            throw new Exception('Неверный формат ссылки');
        }
    }

    private function getYoutubeVideoLink($uri)
    {
        $regex = '/(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/watch\?v=|youtu\.be\/)([^& \n<]+)(?:[^ \n<]+)?/';
        preg_match($regex, $uri, $id);
        if (count($id) > 0) {
            return 'https://www.' . SELF::YOUTUBE_URI . '/embed/' . $id[1];
        } else {
            throw new Exception('Неверный формат ссылки');
        }
    }

    public function cityStat()
    {
        $arr = [];
        $users = UserModel::all()->toArray();
        foreach ($users as $user) {
            $city = strtolower($user['city']);

            if (array_key_exists($city, $arr)) {
                $oldCount = $arr[$city];
                $arr[$city] = $oldCount + 1;
            } else {
                $arr[$city] = 1;
            }
        }
        dd($arr);

    }

    public function onUpdateLikeCount()
    {
        $data = post();
        $resp = $data['response'];
        foreach ($resp as $r) {
            $id = $r['id'];
            if (isset($r['count']['count'])) {
            $count = $r['count']['count'];    
            $project = ProjectModel::findOrFail($id);
                if ((int) $project->like_count != (int) $count) {
                    $project->like_count = (int) $count;
                    $project->save();
                };
            };
        };
        return true;
    }

    


}
