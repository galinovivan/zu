const VK_URL = 'http://api.vk.com';
const param = {
  type: 'sitepage',
  owner_id: 6237768,
  page_id: 24
};
//  fetch(`${VK_URL}/Likes/likes.getList`, {
//     method: 'POST',
//     headers: {
//          'Content-Type': 'application/json'
//      },
//     body: param
// }).then(response => {
//     console.log(response.json())
//  });

// fetch(`${VK_URL}/Likes/likes.getList?type=sitepage&owner_id=6237768page_id=24`)
// .then(response => {
//    console.log(response)
// });