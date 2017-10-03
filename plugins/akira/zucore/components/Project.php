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
        'doc',
        'docx',
        'mp3',
        'mp4',
        'jpg',
        'png',
        'jpeg',
        'gif'
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

    public function projects()
    {

    }

    public function projectsByNomination($nomination)
    {

    }

    public function getById($id)
    {

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

            if (!Input::hasFile('project_file')) {
                throw new Exception('Пожалуйста загрузите вашу работу');
            }

            $file = Input::file('project_file');
            if (!$this->checkFileExtension($file)) {
                throw new Exception('Неверный формат файла');
            }


            $project = ProjectModel::create($data);
            $project->project_file = $file;
            $project->save();
            Flash::success('Ваш проект успешно добавлен!');

        } catch (Exception $e) {
            Flash::error($e->getMessage());
        }



    }


    public function getSchoolProject()
    {
       return $projects =  ProjectModel::where('group', 1)->where('moderation', 1)
            ->orderBy('created_at', 'desc')->simplePaginate(10);
    }

    public function getStudentsProject()
    {
        return $projects =  ProjectModel::where('group', 2)->where('moderation', 1)
            ->orderBy('created_at', 'desc')->simplePaginate(10);
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
    private function getAllowFileExtension()
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


}
