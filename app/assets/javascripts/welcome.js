jQuery(function($) {
  var el = $('.click-to-copy')[0];
  if (el) {
    new Clipboard(el);

    $('.btn-clipboard').mouseenter(function() {
      $(this).addClass('btn-clipboard-hover');
    }).mouseleave(function() {
      $(this).removeClass('btn-clipboard-hover');
    });
  }
});
