

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
};


const setLikesData = () => {
    const likeContainer = $('.project_likes_count');
    let ids = [];
    likeContainer.each(function(key, value) {
        const id = $(this).attr('id');
        ids.push(id);
    });
    //console.log(ids);
    getFullLikesList(ids).then(dataSet => {
        $.request('onUpdateLikeCount', {
            data: dataSet
            // success: function(data) {
            //     console.log(data);
            // }
        });
})
}


function ayncRequestToVkLike(container) {
    return new Promise((resolve, reject) => {
    let index = 0;
    let resultData = [];
    let tmt = setInterval(() => {
        if (index > container.length) {
            clearInterval(tmt);
        }
        let el = $(container[index]);
        let id = el.attr('id');
        console.log(id);
        getLikeCount(id).then(data => {
            console.log(data);
            index++;
            resultData.push({
                'id': id,
                'count': data.response.count
            });
            if (index == container.length) {
                resolve(resultData);
            }
        })
    }, 350);
    })
}

const getFullLikesList = (ids) => {
    return new Promise((resolve, reject) => {
        let queryStr = `var result = [];`;
        for (let i = 0; i < ids.length; i++) {
            queryStr += `var likes${i} = API.likes.getList({
                    "type": "sitepage",
                    "owner_id": 6237768,
                    "item_id": ${ids[i]}});
                     result.push({
                "id": ${ids[i]},
                "count": likes${i}
            });`;
        };
        queryStr += `return result;`;
        //console.log(queryStr);
        VK.api('execute', {
            "code": queryStr
        }, data => resolve(data));

    })
};
export const setFrameCountHandler = frameObject => {
}

export default setLikesData;


