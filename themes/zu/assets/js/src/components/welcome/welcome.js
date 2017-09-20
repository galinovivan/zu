import Cookie from '../../helpers/cookie';

export default new Vue({
   el: '#welcome',
    data: {
       newUser: true,
       step: 1
    },
    created() {
        this.isNewUser();
        if (this.isRegister()) {
            this.step = 3;
        }

    },
    methods: {
        toggleClick(step, event) {
            event.preventDefault();
            this.step = step;
            if (step === 2) {
                setTimeout(() => {
                    $('[data-toggle="tooltip"]').tooltip();
                }, 200)
            }
        },
        isNewUser() {
           if (Cookie.get('user_is_visited')) {
               this.newUser = false;
           } else {
               Cookie.set('user_is_visited', 'true', { expires: true });
           }
        },
        isRegister() {
            return Cookie.get('user_auth');
        }
    }
});
