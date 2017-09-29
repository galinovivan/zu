<?php namespace Akira\Zucore\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateAkiraZucoreProjects extends Migration
{
    public function up()
    {
        Schema::create('akira_zucore_projects', function($table)
        {
            $table->engine = 'InnoDB';
            $table->string('name');
            $table->string('lead')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
            $table->integer('user_id');
            $table->string('nomination');
            $table->increments('id');
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('akira_zucore_projects');
    }
}
