$( document ).ready(function() {

    // Shift nav in mobile when clicking the menu.
    $(document).on('click', "[data-toggle='wy-nav-top']", function() {
      $("[data-toggle='wy-nav-shift']").toggleClass("shift");
      $("[data-toggle='rst-versions']").toggleClass("shift");
    });
    // Close menu when you click a link.
    $(document).on('click', ".wy-menu-vertical .current ul li a", function() {
      $("[data-toggle='wy-nav-shift']").removeClass("shift");
      $("[data-toggle='rst-versions']").toggleClass("shift");
    });
    $(document).on('click', "[data-toggle='rst-current-version']", function() {
      $("[data-toggle='rst-versions']").toggleClass("shift-up");
    });
    // Make tables responsive
    $("table.docutils:not(.field-list)").wrap("<div class='wy-table-responsive'></div>");
    
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

$( document ).ready(function() {
    $('#text-table-of-contents ul').first().addClass('nav');
                                        // ScrollSpy also requires that we use
                                        // a Bootstrap nav component.
    $('body').scrollspy({target: '#text-table-of-contents'});

    // add sticky table headers
    $('table').stickyTableHeaders();

    var $postamble = $('#postamble');
    var $tableOfContents = $('#table-of-contents');
    // set the height of tableOfContents
    //$tableOfContents.height($tableOfContents.height() - $postamble.outerHeight());

});

window.SphinxRtdTheme = (function (jquery) {
    var stickyNav = (function () {
        var navBar,
            win,
            stickyNavCssClass = 'stickynav',
            applyStickNav = function () {
                if (navBar.height() <= win.height()) {
                    navBar.addClass(stickyNavCssClass);
                } else {
                    navBar.removeClass(stickyNavCssClass);
                }
            },
            enable = function () {
                applyStickNav();
                win.on('resize', applyStickNav);
            },
            init = function () {
                navBar = jquery('nav.wy-nav-side:first');
                win    = jquery(window);
            };
        jquery(init);
        return {
            enable : enable
        };
    }());
    return {
        StickyNav : stickyNav
    };
}($));
