import $ from 'jQuery';
export class View {
    element = null;
    driver  = null;
    storage = null;
    constructor(element) {
        this.element = element;
        this.driver = $;
        this.storage = window.localStorage || localStorage;
    }
    render() {
        
    }
    setData() {

    }
    getData(key) {

    }
}