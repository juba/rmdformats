$(function() {

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

    function toggle_page(id) {
      $(".page").not(page).removeClass("active").hide();
      window.page = id;
      var page = $(window.page);
      window.location.hash = window.page;
      //$(this).addClass("active");

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

      window.dispatchEvent(new Event('resize'));

    }

    $('a[href*="#"]').click(function() {

      var id = $(this).attr("href");
      if (id === "#") return;
      if (id.substring(0, 8) === "#dyntab-") return;
      toggle_page(id);

      // Menu
      var menu_entry = $(".menu li[data-target='"+id+"']");
      menu_entry.addClass("active");
      $(".menu li").not(menu_entry).removeClass("active"); 
      

    });

    $(".menu li").click(function () {

      toggle_page($(this).data("target"));

      // Menu
      if (!$(this).data("target")) return;
      if ($(this).is(".active")) return;
      $(".menu li").not($(this)).removeClass("active");
      $(this).addClass("active");

    });

});
