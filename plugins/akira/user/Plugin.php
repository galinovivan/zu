<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 13.09.17
 * Time: 13:23
 */

namespace Akira\User;

use Yaml;
use File;
use System\Classes\PluginBase;
use RainLab\User\Models\User as UserModel;
use RainLab\User\Controllers\Users as UserController;

class Plugin extends PluginBase
{

    public $require = ['RainLab.User'];

    /**
     * @return array
     */
    public function pluginDetails()
    {
        return [
            'name' => 'zu user extends',
            'description' => 'extend for user',
            'author' => 'galinovivan',
            'icon' => 'icon-leaf',
            'homepage' => 'sd'
        ];
    }


    /**
     *
     */
    public function boot()
    {
        UserModel::extend(function($model) {
           $model->addFillable([
               'date_of_bithday',
               'city',
               'phone',
               'school',
               'city',
               'lead'
           ]);

        });

        UserController::extendFormFields(function($widget) {
            if (!$widget->model instanceof UserModel) {
                return;
            }
            $configFile = __DIR__ . '/config/profile_fields.yaml';
            $config = Yaml::parse(File::get($configFile));
            $widget->addFields($config);
        });

    }

}