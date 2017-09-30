/**
 * Created by 91178 on 30.09.2017.
 */

// form.on('change', (e) => {
//     let fileObject = document.getElementById('userAvatar');
//     fileObject = fileObject.files[0];
//     $('body').css('background', `url(http://localhost/${fileObject.name})`)
//     console.log(fileObject.name.relativePath);
// });


const fileInput = $("input[type='file']");
fileInput.on('change', function(e) {
    const label = $(this).siblings(fileInput);
    const fileObject = document.getElementById($(this).attr('id')).files[0];
    label.text(fileObject.name);
});