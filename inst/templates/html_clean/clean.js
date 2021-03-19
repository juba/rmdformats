$(function() {

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

    // ScrollSpy also requires that we use a Bootstrap nav component.
    $('#toc ul').first().addClass('nav');
    $('body').scrollspy({target: '#toc'});

    $("#toc .close").click(function() {
      $("#toc").slideUp();
    })

});
