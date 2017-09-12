const header = new Vue({
    el: '#header',
    data: {
        title: 'zu'
    },
    methods: {
        reverseMessage() {
            this.title = this.title.split('').reverse().join('');
        }
    }
});