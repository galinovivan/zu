import Cookie from '../../helpers/cookie';
import Storage from '../../helpers/storage';

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
            Storage.remove('register');
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
           if (this.isMobile() || Cookie.get('user_is_visited')) {
               this.newUser = false;
           } else {
               Cookie.set('user_is_visited', 'true', { expires: true });
           }
        },
        isRegister() {
            console.log(Storage.get('register'));
            return Storage.get('register');
        },
        isMobile() {
            return screen.width < 1025;
        }
    }
});
