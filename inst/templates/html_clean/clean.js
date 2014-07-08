$(function() {

    /* Table of contents */
    $("#toc").tocify({
	selectors: "h1,h2",
	theme: "none",
	smoothScrollSpeed: "fast",
	highlightOffset: 40,
	showEffectSpeed: "fast",
	hideEffectSpeed: "fast"
    });

    /* Magnific popup */
    $('.image-link').magnificPopup({
	type:'image',
	closeOnContentClick: true
    });

});


