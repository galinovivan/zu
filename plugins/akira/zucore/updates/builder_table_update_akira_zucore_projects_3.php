<?php namespace Akira\Zucore\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateAkiraZucoreProjects3 extends Migration
{
    public function up()
    {
        Schema::table('akira_zucore_projects', function($table)
        {
            $table->string('project_uri')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('akira_zucore_projects', function($table)
        {
            $table->dropColumn('project_uri');
        });
    }
}
