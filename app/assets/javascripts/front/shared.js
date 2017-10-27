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
  $('#popoverRge_eco_artisan').popover();
  $('#popoverCapeb').popover();
  $('#popoverMof').popover();
  $('#popoverArtisan').popover();
  $('#popoverArtisan_d_art').popover();
  $('#popoverMaitre_artisan').popover();

});

$(document).on('click', '.dropdown-menu', function(e) {
    if ($(this).hasClass('keep-open-on-click')) { e.stopPropagation(); }
});
