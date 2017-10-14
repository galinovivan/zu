import getFileAsBuffer from './helpers/file';
import transformFileToHtml from './textreader/textreader';

// var blob;
// getFileAsBuffer('http://localhost/storage/app/uploads/public/59e/106/b4b/59e106b4b28d6190446036.docx')
//     .then( fileData => {
//         transformFileToHtml(fileData)
//         .then(data => {
//             console.log(data);
//         });
//     })
//     .catch( e => {
//         console.log(e);
//     });

const textContainer = $('.doc_prev');
makeTextPresentation(textContainer);


function makeTextPresentation($el) {
    $el.each(function(key, value) {
        const filePath = $(this).attr('data-src');
        getFileAsBuffer(filePath)
            .then(fileData => {
                transformFileToHtml(fileData)
                    .then(data => {
                        console.log(data);
                        $(this).html(data);
                    })
            })
    });
}    