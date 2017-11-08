import getFileAsBuffer from './helpers/file';
import transformFileToHtml from './textreader/textreader';

const textContainer = $('.doc_prev');
makeTextPresentation(textContainer);


function makeTextPresentation($el) {
    $el.each(function(key, value) {
        const filePath = $(this).attr('data-src');
        getFileAsBuffer(filePath)
            .then(fileData => {
                transformFileToHtml(fileData)
                    .then(data => {
                        $(this).html(data);
                    })
            })
    });
}    