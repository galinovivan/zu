    $(document).ready(function() {
        const form = $('.upload_project');
        console.log(form);
        const rButtons = form.find('.multiple_radio');
        const hideInput = form.find('#contributeInput');
        rButtons.click(function(e) {
            console.log(e);
            +$(this).val() === 1 ? hideInput.show() : hideInput.hide();
            console.log(e);
        })
   });