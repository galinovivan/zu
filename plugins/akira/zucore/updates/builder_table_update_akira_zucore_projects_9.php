<?php namespace Akira\Zucore\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateAkiraZucoreProjects9 extends Migration
{
    public function up()
    {
        Schema::table('akira_zucore_projects', function($table)
        {
            $table->integer('age_group')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('akira_zucore_projects', function($table)
        {
            $table->dropColumn('age_group');
        });
    }
}