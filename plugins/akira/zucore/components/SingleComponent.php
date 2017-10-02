<?php namespace Akira\Zucore\Components;

use Cms\Classes\ComponentBase;
use Akira\Zucore\Models\Project;

class SingleComponent extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'SingleComponent Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties()
    {
        return [];
    }

    public function onRun()
    {
        $id = $this->property('alias');
        $this->page['project'] = $this->getById($id);
    }


    public function getById($id)
    {
         return Project::findOrFail($id);
    }
}
