$(document).on('ready page:load', function(){
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
});

$(document).on('turbolinks:load', function(){
      $('.img-zoom').elevateZoom({
      	tint:true, 
      	tintColour:'#ff2e00', 
      	tintOpacity:0.5  
 	  });
}); 