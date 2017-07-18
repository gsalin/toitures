$(document).ready(function() {
  $(function() {

    // textarea count
    $("#user_description").on("keyup", function(){
      var length = $(this).val().length;
      $("#description-count").html(length);
    });
    $("#project_description").on("keyup", function(){
      var length = $(this).val().length;
      $("#description-project-count").html(length);
    });
    $("#article_body").on("keyup", function(){
      var length = $(this).val().length;
      $("#body-article-count").html(length);
    });
    $("#article_body").on("keyup", function(){
      var length = $(this).val().length;
      $("#body-article-count-2").html(length);
    });
    $("#article_title").on("keyup", function(){
      var length = $(this).val().length;
      $("#article-title-count").html(length);
    });
    $("#article_card_summary").on("keyup", function(){
      var length = $(this).val().length;
      $("#article-card-summary-count").html(length);
    });
    $("#article_summary").on("keyup", function(){
      var length = $(this).val().length;
      $("#article-summary-count").html(length);
    });

    var titres = ["Restauration d'une toiture ancienne", "Etanchéité et pose d'une terrasse", "Pose d'une véranda", "Restauration d'une église", "Création d'une fenêtre de toit"]

    setInterval(function(){
      var titre = titres[Math.floor(Math.random()*titres.length)];
      $("#project_title").attr("placeholder", titre);
    }, 2000);

    var villes = ["Bourg-en-Bresse", "Boulogne-Billancourt", "Saint-Malo", "Périgueux"]

    setInterval(function(){
      var ville = villes[Math.floor(Math.random()*villes.length)];
      $("#project_address").attr("placeholder", ville);
    }, 2000);

      $('body').on("click", ".dropdown-menu", function (e) {
        $(this).parent().is(".open");
    });
  });

  $('form').on('focus', 'input[type=number]', function (e) {
    $(this).on('mousewheel.disableScroll', function (e) {
      e.preventDefault()
    })
  })
  $('form').on('blur', 'input[type=number]', function (e) {
    $(this).off('mousewheel.disableScroll')
  })
});

