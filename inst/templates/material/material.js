$(function() {

    /* Menu */
    $('#toc ul').first().addClass('nav');
    $('#toc ul li').addClass('withripple');
    $('#toc ul li').attr("data-target", function() {
        return($(this).children("a").attr("href"));
    })
    $('body .section.level1').addClass("well page");

    $(window).on("resize", function () {
      $("html, body").height($(window).height());
      $(".main, .menu").height($(window).height() - $(".header-panel").outerHeight());
      $(".pages").height($(window).height());
    }).trigger("resize"); 

});
