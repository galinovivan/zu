<?php namespace Akira\Zucore\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateAkiraZucoreProjects2 extends Migration
{
    public function up()
    {
        Schema::table('akira_zucore_projects', function($table)
        {
            $table->text('contributers')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('akira_zucore_projects', function($table)
        {
            $table->dropColumn('contributers');
        });
    }
}
