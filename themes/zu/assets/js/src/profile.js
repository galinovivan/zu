(function($) {
    $(document).ready(function() {

        const changeButton = $('#changeProfile');
        const profileForm = $('.profile_form_hide');
        const profileContainer = $('.profile_container');
        changeButton.click((e) => {
            profileForm.show();
            profileContainer.hide();
        });


    });

})(jQuery);