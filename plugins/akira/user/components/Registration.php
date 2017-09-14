<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 14.09.17
 * Time: 13:59
 */

namespace Akira\User\Components;

use Cms\Classes\ComponentBase;
use RainLab\User\Models\UserGroup;

class Registration extends ComponentBase
{

    public function componentDetails()
    {
        return [
          'name' => 'registration',
           'description' => 'user registration'
        ];
    }

    public function onRun() {
        $userGroup = UserGroup::all();
        $this->page['users_groups'] = $userGroup;
    }

}