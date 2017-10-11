    $(document).ready(function() {
        const form = $('.upload_project');
        console.log(form);
        const rButtons = form.find('.multiple_radio');
        const hideInput = form.find('#contributeInput');
        rButtons.click(function(e) {
            console.log(e);
            +$(this).val() === 1 ? hideInput.show() : hideInput.hide();
            console.log(e);
        });


        const projectUriBtn = form.find('#projectUriBtn');
        const field = form.find('#projectUriField');
        const uploadField = form.find('.upload_file');
        projectUriBtn.click(function(e) {
            e.preventDefault();
            isElemHide(field) ? $(this).text('Загрузить файл с работой') :
            $(this).text('Прикрепить ссылку на видео');
            field.slideToggle(100); 
            uploadField.slideToggle(100);
            
        });


        /**
         * @param {jQuery|elem}
         * return Boolean  
         */
        function isElemHide($elem) {
            return ($elem.css('display') == 'none' || $elem.css('visibility') == 'hidden');
        }

   });