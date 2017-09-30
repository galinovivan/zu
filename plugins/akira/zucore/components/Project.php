<?php namespace Akira\Zucore\Components;

use Cms\Classes\ComponentBase;
use Illuminate\Support\Facades\Input;
use Akira\Zucore\Models\Project as ProjectModel;
use Exception;
use Flash;
use Validator;
use ValidationException;

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
     * @throws Exception
     */
    public function onProjectUpload()
    {
        try {
            $data = post();

            $rules = [
                'name' => 'required|between:1, 255',
                'nomination' => 'required',
            ];

            $validation = Validator::make($data, $rules);

            if ($validation->fails()) {
                throw new ValidationException($validation);
            }

            if (!Input::hasFile('project_file')) {
                throw new Exception('Пожалуйста загрузите вашу работу');
            }

            $file = Input::file('project_file');
            if (!$this->getAllowFileExtension($file)) {
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


    /**
     * @param $file
     * @return bool
     */
    public function checkFileExtension($file)
    {
        $allowExtension = $this->getAllowFileExtension();

        return in_array($allowExtension, $file->extension());

    }

    /**
     * @return mixed
     */
    private function getAllowFileExtension()
    {
        return $this->allowFileExtension;
    }


    /**
     * @return array
     */
    public function getNomination()
    {
        return [
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
                'label' => 'Дошкольники',
                'value' => 'child'
            ]
        ];
    }


}
