$(document).ready(function() {
  $(function() {
    $("#user_description").on("keyup", function(){
      var length = $(this).val().length;
      $("#description-count").html(length);
    });
  });
});

