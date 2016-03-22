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

    /* Pilltabs */
    /* Automatically add active class to first elements */
    $(".nav-pilltabs").each(function() {
      $(this).find("li").first().addClass("active")
    })
    $(".tab-content").each(function() {
      $(this).find(".tab-pane").first().addClass("active")
    })

});


