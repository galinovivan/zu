<?php namespace Akira\Zucore\Services;

use Akira\Zucore\Models\Project as ProjectModel;

class DbServiceScript {

    const VK_API_LIKE = 'http://api.vk.com/method/likes.getList';
    const VK_APP_KEY = 6237768;

    public static function rebaseCountField($group)
    {
        $projects = ProjectModel::where('group', $group)->get();
        
        // foreach ($projects as $project) {
        //     $project->like_count = (int) self::getLikesFromVkService($project->id);
        //     $project->save();
        // }
        for ($i = 0; $i <500; $i++) {
            $count = self::getLikesFromVkService($i);
            $project = ProjectModel::findOrFail('id', $i);
            $project->like_count = $count;
            $project->save();
        }

    }

    public static function getLikesFromVkService($id)
    {
        $requestParam = [
            'type' => 'sitepage',
            'owner_id' => self::VK_APP_KEY,
            'item_id' => $id
        ];

        $getParams = http_build_query($requestParam);
        $result = json_decode(file_get_contents(self::VK_API_LIKE . '?' . $getParams));
        

        return $result->response->count;

    
    }
}