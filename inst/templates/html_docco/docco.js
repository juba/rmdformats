$(function() {

    /* Magnific popup */
    $('.image-link').each(function() {
	$(this).magnificPopup({
	    type:'image',
	    closeOnContentClick: true,
	    items: {
		src: $(this).find('img').attr('src'),
	    }
	});
    });

});


