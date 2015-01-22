$(function() {

    /* Table of contents */
    $("#toc").tocify({
    	selectors: "h1,h2",
      ignoreSelector: "h1.title",
    	theme: "none",
    	smoothScrollSpeed: "fast",
    	highlightOffset: 40,
    	showEffectSpeed: "fast",
    	hideEffectSpeed: "fast"
    });

    $("#toc .close").click(function() {
      $("#toc").slideUp();
    })

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


