(function( $ ) {

    $(document).ready( () => {
        const postItem = $('.news_item');

        postItem.each(function() {
            const
                content = $(this).find('.post_content'),
                summary = $(this).find('.post_summary');

            $(this).find('.postMore').click( (e) => {
                e.preventDefault();
                summary.hide();
                content.show();
            });
            $(this).find('.postRmore').click( (e) => {
               e.preventDefault();
               content.hide();
               summary.show();
            })
        })

    });


})(jQuery);