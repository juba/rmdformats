$( document ).ready(function() {

    if ($(document).width() <= 1000) {
      $(".book").removeClass("with-summary");
    }
    // Shift nav in mobile when clicking the menu.
    $(document).on('click', ".toggle-sidebar", function() {
      $(".book").toggleClass("with-summary");
    });

    // ScrollSpy also requires that we use a Bootstrap nav component.
    $('#toc ul').first().addClass('nav');
    $('.book-body').scrollspy({target: '#toc'});

    $("body").removeClass("preload");

});
