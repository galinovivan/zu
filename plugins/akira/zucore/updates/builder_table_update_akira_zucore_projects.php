<?php namespace Akira\Zucore\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateAkiraZucoreProjects extends Migration
{
    public function up()
    {
        Schema::table('akira_zucore_projects', function($table)
        {
            $table->integer('moderation');
            $table->increments('id')->unsigned(false)->change();
        });
    }
    
    public function down()
    {
        Schema::table('akira_zucore_projects', function($table)
        {
            $table->dropColumn('moderation');
            $table->increments('id')->unsigned()->change();
        });
    }
}
