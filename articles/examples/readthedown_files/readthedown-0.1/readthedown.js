$( document ).ready(function() {

    // Fix for dots in level 1 and level 2 titles
    $('body .section.level1').each(function () {
      $(this).attr("id", $(this).attr("id").replace(/\./g, "-"));
    });
    $('body .section.level2').each(function () {
      $(this).attr("id", $(this).attr("id").replace(/\./g, "-"));
    });
    $('#toc ul li a').each(function () {
      $(this).attr("href", $(this).attr("href").replace(/\./g, "-"));
    });

    // Shift nav in mobile when clicking the menu.
    $(document).on('click', "[data-toggle='wy-nav-top']", function() {
      $("[data-toggle='wy-nav-shift']").toggleClass("shift");
    });
    // Close menu when you click a link.
    $(document).on('click', "#toc ul li a", function() {
      $("[data-toggle='wy-nav-shift']").removeClass("shift");
    });
    // Close menu when you click on main content
    $(document).on('click', "#main, #header", function() {
      $("[data-toggle='wy-nav-shift']").removeClass("shift");
    });

    // Make tables responsive
    $("#main table").wrap("<div class='table-wrapper'></div>");

    // ScrollSpy also requires that we use a Bootstrap nav component.
    $('#toc ul').first().addClass('nav');
    $('body').scrollspy({target: '#toc'});

    // add sticky table headers
    //$('table').stickyTableHeaders();

});
