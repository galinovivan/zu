import Cookie from '../../helpers/cookie';

export default new Vue({
   el: '#welcome',
    data: {
       newUser: true
    },
    created() {
       if (Cookie.get('user_is_visited')) {
           this.newUser = false;
       } else {
           Cookie.set('user_is_visited', 'true', { expires: 604800 })
       }
    },
    methods: {
    }
});
