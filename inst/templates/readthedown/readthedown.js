$( document ).ready(function() {

    // Shift nav in mobile when clicking the menu.
    $(document).on('click', "[data-toggle='wy-nav-top']", function() {
      $("[data-toggle='wy-nav-shift']").toggleClass("shift");
    });
    // Close menu when you click a link.
    $(document).on('click', "#table-of-contents ul li a", function() {
      $("[data-toggle='wy-nav-shift']").removeClass("shift");
    });
    // Close menu when you click on main content
    $(document).on('click', "#main, #header", function() {
      $("[data-toggle='wy-nav-shift']").removeClass("shift");
    });

    // Make tables responsive
    $("#main table").wrap("<div class='table-wrapper'></div>");
    /* Pilltabs */
    /* Automatically add active class to first elements */
    $(".nav-pilltabs").each(function() {
      $(this).find("li").first().addClass("active")
    })
    $(".tab-content").each(function() {
      $(this).find(".tab-pane").first().addClass("active")
    })

    // ScrollSpy also requires that we use a Bootstrap nav component.
    $('#text-table-of-contents ul').first().addClass('nav');
    $('body').scrollspy({target: '#text-table-of-contents'});

    // add sticky table headers
    //$('table').stickyTableHeaders();

});
