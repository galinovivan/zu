import fragment from './helpers/url';
import SessionStorage from './helpers/session';

(function ( $ ) {

    $(document).ready(() => {
        const url = fragment();
        const projectFilterItems = $('.project_filter').find('a');
        const defaultFilter = $('.default_filter');
        projectFilterItems.each(function(key, value) {
            const currFilter = $(this).attr('data-filter');
            $(this).click( function() {
                SessionStorage.set('active_filter', currFilter);
            })
        });
        if (url.indexOf('filter') != -1) {
            const activeFilter = SessionStorage.get('active_filter');
            if (activeFilter) {
                $('[data-filter='+activeFilter+']').toggleClass('active');
            }
        } else {
            defaultFilter.toggleClass('active');
        }
    })
})(jQuery);