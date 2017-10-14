import * as file2html from 'file2html';
import OOXMLReader from 'file2html-ooxml';

const transformFileToHtml = file => {

return new Promise( (resolve, reject) => {
    file2html.config({
    readers: [
        OOXMLReader
    ]
});

const meta = {
    fileType: 1,
    mimeType: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
};
file2html.read({
    fileBuffer: file,
    meta: meta
}).then( (fileData) => {
    const { styles, content } = fileData.getData();
    const data = styles + content;
    resolve(data);
})
})

} 
export default transformFileToHtml;