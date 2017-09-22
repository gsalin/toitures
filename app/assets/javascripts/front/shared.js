$(document).ready(function() {
  $('.carousel').carousel({
    interval: false,
    pause: null,
  });
  $('#popoverRge').popover();
  $('#popoverQualibat').popover();
  $('#popoverGmh').popover();
  $('#popoverFfb').popover();
  $('#popoverEpv').popover();
});

$(document).on('click', '.dropdown-menu', function(e) {
    if ($(this).hasClass('keep-open-on-click')) { e.stopPropagation(); }
});
