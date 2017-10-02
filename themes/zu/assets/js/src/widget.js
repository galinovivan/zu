import $ from 'jquery';
(function() {
    const widget = $('.widget');
    const button = widget.find('.action_button');
    const hideInfo = widget.find('.swipe_info');

    button.click(function(e) {
        $(this).siblings('.swipe_info').toggleClass('open');
    })
})();

