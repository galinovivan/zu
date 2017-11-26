

function likeInit(el) {
    const id = el.attr('id');
    VK.Widgets.Like(id, {type: 'mini', width: 85, height: 18}, id);
}

export default likeInit;