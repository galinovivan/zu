<?php

namespace Akira\User\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;


class UserAddFields extends Migration
{

    public function up()
    {

        if (Schema::hasColumns('users', ['date_of_bithday','city', 'phone', 'school'])) {
            return;
        }

        Schema::table('users', function($table) {
           $table->date('date_of_bithday')->nullable();
           $table->string('city')->nullable();
           $table->string('phone')->nullable();
           $table->string('school')->nullable();
        });
    }

    public function down()
    {
        if (Schema::hasTable('users')) {
            Schema::table('users', function($table) {
               $table->dropColumn(['date_of_bithday','city', 'phone', 'school']);
            });
        }
    }


}