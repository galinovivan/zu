
$(document).ready(function() {
    if (!isMobile()) {
        $('[data-toggle="tooltip"]').tooltip();
    }

    function isMobile() {
        return $(window).width() < 1025;
    }
});