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
        $project = $this->getById($id);

        $authorAge = $this->getAuthorAge($project->user->date_of_bithday);

        $this->page['project'] = $project;
        $this->page['author_age'] = $authorAge;
    }


    public function getById($id)
    {
         return Project::findOrFail($id);
    }

    private function getAuthorAge($dateBt)
    {
        $currDate = new \DateTime();
        $dateBt = new \DateTime($dateBt);
        $age = $currDate->diff($dateBt);
        $age = $age->format('%y');
        return $age;
    }
}
