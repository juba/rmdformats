$(function() {

    // Fix for dots in level 1 titles
    $('body .section.level1').each(function() {
      $(this).attr("id", $(this).attr("id").replace(/\./g , "-"));
    });
    $('#toc ul li a').each(function() {
      $(this).attr("href", $(this).attr("href").replace(/\./g , "-"));
    });

    /* Menu */
    $('#toc ul').first().addClass('nav');
    $('#toc ul li').addClass('withripple');
    $('#toc ul li').attr("data-target", function() {
        return($(this).children("a").attr("href"));
    });
    $('body .section.level1').addClass("well page");

    $(window).on("resize", function () {
      $("html, body").height($(window).height());
      $(".main, .menu").height($(window).height() - $(".header-panel").outerHeight());
      $(".pages").height($(window).height());
    }).trigger("resize"); 

});
