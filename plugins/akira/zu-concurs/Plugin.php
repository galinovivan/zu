<?php namespace Akira\ZuConcurs;

use Backend;
use System\Classes\PluginBase;

/**
 * zu-concurs Plugin Information File
 */
class Plugin extends PluginBase
{
    /**
     * Returns information about this plugin.
     *
     * @return array
     */
    public function pluginDetails()
    {
        return [
            'name'        => 'zu-concurs',
            'description' => 'zu',
            'author'      => 'akira',
            'icon'        => 'icon-bug'
        ];
    }

    /**
     * Register method, called when the plugin is first registered.
     *
     * @return void
     */
    public function register()
    {

    }

    /**
     * Boot method, called right before the request route.
     *
     * @return array
     */
    public function boot()
    {

    }

    /**
     * Registers any front-end components implemented in this plugin.
     *
     * @return array
     */
    public function registerComponents()
    {
        // Remove this line to activate

        return [
            'Akira\ZuConcurs\Components\MyComponent' => 'myComponent',
        ];
    }

    /**
     * Registers any back-end permissions used by this plugin.
     *
     * @return array
     */
    public function registerPermissions()
    {
        return [
            'akira.zu-concurs.some_permission' => [
                'tab' => 'zu-concurs',
                'label' => 'Some permission'
            ],
        ];
    }

    /**
     * Registers back-end navigation items for this plugin.
     *
     * @return array
     */
    public function registerNavigation()
    {
        return [
            'zu-concurs' => [
                'label'       => 'zu-concurs',
                'url'         => Backend::url('akira/zu-concurs/projectscontroller'),
                'icon'        => 'icon-leaf',
                'permissions' => ['akira.zu-concurs.*'],
                'order'       => 500,
            ],
        ];
    }
}
