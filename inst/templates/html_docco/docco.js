$(function() {

    /* Magnific popup */
    $('.figure img').each(function() {
      $(this).magnificPopup({
        type:'image',
	      closeOnContentClick: true,
	      items: {
		      src: $(this).attr('src'),
          title: $(this).attr('alt'),
	      },
        titleSrc: 'title',
 	    });
      $(this).addClass("image-thumb");
    });

});


