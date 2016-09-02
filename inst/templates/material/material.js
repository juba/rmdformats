$(function() {

    /* Pilltabs */
    /* Automatically add active class to first elements */
    $(".nav-pilltabs").each(function() {
      $(this).find("li").first().addClass("active")
    });
    $(".tab-content").each(function() {
      $(this).find(".tab-pane").first().addClass("active")
    });

    /* Menu */
    $('#toc ul').first().addClass('nav');
    $('#toc ul li').addClass('withripple').first().addClass("active");
    $('#toc ul li').attr("data-target", function() {
        return($(this).children("a").attr("href"));
    })
    $('body .section.level1').addClass("well page").first().addClass("active");

    $(window).on("resize", function () {
      $("html, body").height($(window).height());
      $(".main, .menu").height($(window).height() - $(".header-panel").outerHeight());
      $(".pages").height($(window).height());
    }).trigger("resize");

    $(".menu li").click(function () {
      // Menu
      if (!$(this).data("target")) return;
      if ($(this).is(".active")) return;
      $(".menu li").not($(this)).removeClass("active");
      $(".page").not(page).removeClass("active").hide();
      window.page = $(this).data("target");
      var page = $(window.page);
      window.location.hash = window.page;
      $(this).addClass("active");

      page.show();

      var totop = setInterval(function () {
        $(".pages").animate({scrollTop: 0}, 0);
      }, 10);

      setTimeout(function () {
        page.addClass("active");
        setTimeout(function () {
          clearInterval(totop);
        }, 1000);
      }, 100);
    });

});
