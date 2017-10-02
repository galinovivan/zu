(function($) {
    $(document).ready(function() {

        const changeButton = $('#changeProfile');
        const profileForm = $('.profile_form_hide');
        const profileContainer = $('.profile_container');
        changeButton.click((e) => {
            profileForm.show();
            profileContainer.hide();
        });


        const projectUploadMore = $('#projectUploadMore');
        const projectList = $('#profileProjectList');
        const hideProjectForm = $('#profileHideProjectForm');

        projectUploadMore.click((e) => {
            projectList.slideToggle('fast');
            hideProjectForm.slideToggle('fast');
        })


    });

})(jQuery);