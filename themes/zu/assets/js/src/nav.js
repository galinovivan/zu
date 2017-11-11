(function($) {

$(document).ready(function() {

    const navToggle = $('.nav_toggle');
    const menu = $('.menu');
    const close = menu.find('.nav_close');

    navToggle.click( (e) => {
        menu.toggleClass('open');
        if (isMobile()) {
            navToggle.hide();
            $('body').toggleClass('overfl_hide');
        }
    });
    close.click( (e) => {
        menu.toggleClass('open');
        if (isMobile()) {
            navToggle.show();
            $('body').toggleClass('overfl_hide');
        }
    });
/* anna */
    const nomHeaders = $('.nominationContainer').find('h3');

    nomHeaders.each(function(key, value) {
        $(this).click(function() {
            $(this).next('p').slideToggle();
        })
    });
    const closeLabel = $('.closeLabel');

    closeLabel.click(function () {
        $('.labelCircle').slideToggle('fast');
    });

    const face = $('.tile');

    face.click(function () {
        $(this).toggleClass('openTile');
    })
    if ($('div').hasClass('step_user_two')) {
        $('header').css('background','red');
    }

/* end anna */
});
    /**
     *
     * @returns {boolean}
     */
    function isMobile() {
    return $(window).width() < 1024;
}

})(jQuery);
