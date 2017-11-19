/**
 * Created by 91178 on 28.10.2017.
 */
import likeInit from './like';
//import { getLikeCount, setFrameCountHandler } from './vk_helpers';

VK.init({
    apiId: 6237768,
    //onlyWidgets: true
});


window.onload = () => {
  const likeElems = $('.project_likes_count');
  if (likeElems) {
      likeElems.each(function () {
          likeInit($(this));
      });
  }


};

