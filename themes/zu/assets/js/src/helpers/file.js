

const getFileAsBuffer = filePath => {
  return new Promise((resolve, reject) => {
      var oReq = new XMLHttpRequest();
      oReq.open("GET", filePath, true);
      oReq.responseType = "blob";
      oReq.onload = function (oEvent) {
        const resp = oReq.response;
        var fr = new FileReader();
        fr.readAsArrayBuffer(resp);
        fr.onload = () => {
          resolve(fr.result);
        }
      }
      oReq.onerror = function () {
        reject(this.status);
      }
      oReq.send();
  })
};




export default getFileAsBuffer;
