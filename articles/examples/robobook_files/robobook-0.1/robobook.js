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


    if ($(document).width() <= 1000) {
      $(".book").removeClass("with-summary");
    }
    // Shift nav in mobile when clicking the menu.
    $(document).on('click', ".toggle-sidebar", function() {
      $(".book").toggleClass("with-summary");
    });

    // Make tables responsive
    $(".book-body table").wrap("<div class='table-wrapper'></div>");

    // ScrollSpy also requires that we use a Bootstrap nav component.
    $('#toc ul').first().addClass('nav');
    $('.book-body').scrollspy({target: '#toc'});

    $("body").removeClass("preload");

});
