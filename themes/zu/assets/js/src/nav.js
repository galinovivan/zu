(function($) {

$(document).ready(function() {

    const navToggle = $('.nav_toggle');
    const menu = $('.menu');
    const close = menu.find('.nav_close');

    navToggle.click( (e) => {
        menu.toggleClass('open');
    });
    close.click( (e) => {
        menu.toggleClass('open');
    })

});

})(jQuery);