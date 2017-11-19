

export const getLikeCount = itemId => {
    return new Promise((resolve, reject) => {
        VK.api('likes.getList', {
            "type": "sitepage",
            "owner_id": 6237768,
            "item_id": itemId,
        }, data => {
        resolve(data);
        })
    })
}

export const setFrameCountHandler = frameObject => {
    console.log(frameObject)
}
