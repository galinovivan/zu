/**
 * Created by master on 04.04.2017.
 */
(function( $ ) {


    $(window).on('load', function() {
        initPreloader();
    });


    /**
     */
    function initPreloader() {
        const $preloader = $('#pagePreloader'),
            $spinner = $preloader.find('.spinner');

        $spinner.fadeOut('fast');
        $preloader.fadeOut('fast');
    }

})(jQuery);