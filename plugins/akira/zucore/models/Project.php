<?php namespace Akira\Zucore\Models;

use Model;

/**
 * Model
 */
class Project extends Model
{
    use \October\Rain\Database\Traits\Validation;
    
    /*
     * Validation
     */
    public $rules = [
    ];

    protected $fillable = [
        'user_id'
    ];

    public $attachOne = ['project_file' => ['System\Models\File']];

    /**
     * @var string The database table used by the model.
     */
    public $table = 'akira_zucore_projects';

    public $belongsTo = [
        'user' => ['RainLab\User\Models\User', 'foreignKey' => 'user_id']
    ];
}