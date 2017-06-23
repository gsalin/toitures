$(document).ready(function() {
  $('.carousel').carousel({
    interval: false,
    pause: null,
  });
});

$(document).on('click', '.dropdown-menu', function(e) {
    if ($(this).hasClass('keep-open-on-click')) { e.stopPropagation(); }
});
