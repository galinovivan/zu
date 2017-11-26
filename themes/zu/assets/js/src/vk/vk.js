
import setLikesData from './vk_helpers';
import likeInit from './like';
//import { getLikeCount, setFrameCountHandler } from './vk_helpers';

VK.init({
    apiId: 6237768,
    // onlyWidgets: true
});


window.onload = () => {
  const likeElems = $('.project_likes_count');
  if (likeElems) {
      likeElems.each(function () {
          likeInit($(this));
      });
  }
  VK.Observer.subscribe('widgets.like.liked', count => {
        setLikesData();
    });
    VK.Observer.subscribe('widgets.like.unliked', count => {
        setLikesData();
    });


};

