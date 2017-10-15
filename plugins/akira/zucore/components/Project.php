<?php namespace Akira\Zucore\Components;

use Cms\Classes\ComponentBase;
use Illuminate\Support\Facades\Input;
use Akira\Zucore\Models\Project as ProjectModel;
use Exception;
use Flash;
use Validator;
use ValidationException;
use RainLab\User\Components\Account;

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
        '3gpp'
    ];

    const YOUTUBE_URI = 'youtube.com';
    const ALTERNATIVE_YOUTUBE_URI = 'youtu.be';

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
       return $projects =  ProjectModel::where('group', 1)->where('moderation', 1)
            ->orderBy('created_at', 'desc')->paginate(12);
    }

    public function getStudentsProject()
    {
        if (isset ($_GET['filter']) && $_GET['filter'] == 'true') {
            return $this->filterProject();
        }
        return $projects =  ProjectModel::where('group', 2)->where('moderation', 1)
            ->orderBy('created_at', 'desc')->paginate(12);
    }

    public function filterProject()
    {
        $group = $_GET['group'];
        $filter = $_GET['filter'];
        $nomination = $_GET['nomination'];
        $order = isset($_GET['order']) ? $_GET['order'] : 'desc';
        return ProjectModel::where('group', $group)->where('moderation', 1)
        ->where('nomination', $nomination)->orderBy('created_at', $order)->paginate(12)
        ->appends([
            'group' => $group,
            'nomination' => $nomination,
            'order' => $order,
            'filter' => $filter
        ]);
    }

    /**
     * @param $filePath
     * @return string
     */
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


}
