import fragment from './helpers/url';
(function ( $ ) {

    $(document).ready(() => {
        const url = fragment();
        const projectFilterItems = $('.project_filter').find('a');
        const defaultFilter = $('.default_filter');
        if (url.indexOf('filter') != -1) {
            defaultFilter.toggleClass('active');
        } else {
        projectFilterItems.each(function(key, value) {
            const currNom = $(this).attr('data-filter');
            if (url.indexOf(currNom) != -1) {
                $(this).toggleClass('active');
            }
        })
    };
    })
})(jQuery);