var refreshRating = function() {
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
        readOnly: true,
        score: function() {
            return $(this).attr('data-score');
        }
    });
};

$(document).on('turbolinks:load ajaxSuccess',function(){
    refreshRating();
    $('.product-column').matchHeight();

    $('.alert').delay(2000).fadeOut(1500);


    $('.image-zoom').elevateZoom({
        zoomType: 'lens',
        lensShape: 'round',
        lensSize: 150
    });

    //changes navigation-bar when scrolling
    var scroll_start = 0;
    var startchange = $('.container');
    var offset = startchange.offset();
    if (startchange.length) {
        $(document).scroll(function () {
            scroll_start = $(this).scrollTop();
            if (scroll_start > offset.top) {
                $(".navbar-default").css('background-color', 'rgba(0,0,0,0.5)');
                $('.navbar').css('border-bottom', '1px solid rgba(255,255,255,0.7)');
            } else {
                $('.navbar-default').css('background-color', 'transparent');
                $('.navbar').css('border', '0');
            }
        });

    }
});