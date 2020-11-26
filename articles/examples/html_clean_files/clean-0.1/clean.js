$(function() {

    // ScrollSpy also requires that we use a Bootstrap nav component.
    $('#toc ul').first().addClass('nav');
    $('body').scrollspy({target: '#toc'});

    $("#toc .close").click(function() {
      $("#toc").slideUp();
    })

});
