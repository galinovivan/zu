<?php
/**
 * Created by PhpStorm.
 * User: 91178
 * Date: 30.09.2017
 * Time: 0:04
 */

namespace Akira\User\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class userAddProfileIsExistsField extends Migration
{

    public function up()
    {
        Schema::table('users', function($table) {
            $table->boolean('is_profile_exists')->default(false);
        });
    }

    public function down()
    {
        Schema::table('users', function($table) {
            $table->dropColumn('is_profile_exists');
        });
    }

}