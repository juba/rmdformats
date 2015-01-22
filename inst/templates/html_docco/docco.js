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

    /* Pilltabs */
    /* Automatically add active class to first elements */
    $(".nav-pilltabs").each(function() {
      $(this).find("li").first().addClass("active")
    })
    $(".tab-content").each(function() {
      $(this).find(".tab-pane").first().addClass("active")
    })


});


