<?php namespace Akira\Zucore;

use System\Classes\PluginBase;
use Illuminate\Support\Facades\Input;

class Plugin extends PluginBase
{
    /**
     * @return array
     */
    public function registerComponents()
    {
        return ['Akira\Zucore\Components\Project' => 'Project'];
    }

    public function registerSettings()
    {
    }
}
