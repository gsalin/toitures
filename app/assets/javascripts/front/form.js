$(document).ready(function() {
  $(function() {

    // count pour description user
    $("#user_description").on("keyup", function(){
      var length = $(this).val().length;
      $("#description-count").html(length);
    });

    // count pour les projets
    $("#project_title").on("keyup", function(){
      var length = $(this).val().length;
      $("#title-project-count").html(length);
    });
    $("#project_description").on("keyup", function(){
      var length = $(this).val().length;
      $("#description-project-count").html(length);
    });

    // count pour les articles
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

    // count pour les job_ads
     $("#job_ad_title").on("keyup", function(){
      var length = $(this).val().length;
      $("#title-job-ad-count").html(length);
    });
    $("#job_ad_description").on("keyup", function(){
      var length = $(this).val().length;
      $("#description-job-ad-count").html(length);
    });

    // count pour les job_offers
     $("#job_offer_title").on("keyup", function(){
      var length = $(this).val().length;
      $("#title-job-offer-count").html(length);
    });
    $("#job_offer_description").on("keyup", function(){
      var length = $(this).val().length;
      $("#description-job-offer-count").html(length);
    });
    $("#job_offer_mission").on("keyup", function(){
      var length = $(this).val().length;
      $("#mission-job-offer-count").html(length);
    });
    $("#job_offer_profile").on("keyup", function(){
      var length = $(this).val().length;
      $("#profile-job-offer-count").html(length);
    });



    var titres = ["Restauration d'une toiture ancienne à Tours", "Etanchéité et création d'une terrasse à Garches ", "Pose d'une véranda dans un pavillon", "Restauration d'une église en Charente", "Création d'une fenêtre de toit"]

    setInterval(function(){
      var titre = titres[Math.floor(Math.random()*titres.length)];
      $("#project_title").attr("placeholder", titre);
    }, 2000);

    var villes = ["Bourg-en-Bresse", "Boulogne-Billancourt", "Saint-Malo", "Périgueux","Rennes"]

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

