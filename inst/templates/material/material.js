$(function () {

  var setup = function () {

    // Fix for dots in level 1 titles
    $('body .section.level1').each(function () {
      $(this).attr("id", $(this).attr("id").replace(/\./g, "-"));
    });
    $('#toc ul li a').each(function () {
      $(this).attr("href", $(this).attr("href").replace(/\./g, "-"));
    });

    /* Menu */
    $('#toc ul').first().addClass('nav');
    $('#toc ul li').addClass('withripple').ripples();
    $('#toc ul li').attr("data-target", function () {
       return ($(this).children("a").attr("href"));
    });
    $('body .section.level1').addClass("well page");

  };

  // Run setup at startup for non shiny documents
  setup();

  // Wait for page elements to be present, in case of runtime: shiny
  var wait_ready = function() {
    if ($('.section.active').length == 0 || $('#toc ul li').length == 0) {
      var timeout = window.setTimeout(wait_ready, 150);
    } else {
      window.clearTimeout(timeout);
      setup();
    }
  }

  wait_ready();

  $(window).on("resize", function () {
    $("html, body").height($(window).height());
    $(".main, .menu").height($(window).height() - $(".header-panel").outerHeight());
    $(".pages").height($(window).height());
  }).trigger("resize");

});
