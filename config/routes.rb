  Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {:registrations => 'registrations'}
  root to: 'pages#home'
  resources :users, only: [:index, :show, :edit, :update], path: 'annuaire' do
    get 'annuaire-des-candidats', on: :collection, controller: "users", action: "annuaire_des_candidats"
  end
  resources :projects
  resources :needs, only: [:new, :create, :show, :edit, :update]
  resources :clients, only: [:new, :create, :edit, :update]
  resources :articles, only: [:index, :new, :create, :show, :edit, :update], path: 'magazine'  do
    get 'energie', on: :collection, controller: "articles", action: "energie"
    get 'environnement', on: :collection, controller: "articles", action: "environnement"
    get 'technique', on: :collection, controller: "articles", action: "technique"
    get 'style', on: :collection, controller: "articles", action: "style"
    get 'patrimoine', on: :collection, controller: "articles", action: "patrimoine"
    get 'mes_articles', on: :collection, controller: "articles", action: "mes_articles"
  end
  #page robot (indexation google)
  get '/robots.:format' => 'pages#robots'

  #pages classiques
  get 'qui-sommes-nous', to: 'pages#qui_sommes_nous'
  get 'contact', to: 'pages#contact'
  get "services-aux-particuliers", to: 'pages#services_aux_particuliers'
  get "services-aux-professionnels", to: 'pages#services_aux_professionnels'
  get "services-aux-candidats", to: 'pages#services_aux_candidats'
  get "cgu", to: 'pages#cgu'
  get "mentions-legales", to: 'pages#mentions_legales'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # partie magazine en dur (pour l'instant non utilisée, remplacé par la partie articles)
  # get 'magazines/index'
  # resources :magazine, only: [ :index ] do
  #   get 'energie', on: :collection, controller: "energies", action: "index"
  #   get 'energie/photovoltaique_2017', on: :collection, controller: "energies", action: "photovoltaique_2017"
  # end

  # Partie guides
  get 'guides', to: 'guides#index'
  resources :guide, only: [ :index ] do

    # guide de la toiture
    get 'la-toiture', on: :collection, controller: "toitures", action: "index"
    get 'la-toiture/les-aides-et-les-financements-pour-vos-travaux-de-toiture', on: :collection, controller: "toitures", action: "les_aides_et_les_financements_pour_vos_travaux_de_toiture"
    get 'la-toiture/la-structure-du-toit', on: :collection, controller: "toitures", action: "la_structure_du_toit"
    get 'la-toiture/les-differents-types-de-toit', on: :collection, controller: "toitures", action: "les_differents_types_de_toit"
    get 'la-toiture/achat-nos-conseils-lors-du-choix-de-votre-toiture', on: :collection, controller: "toitures", action: "achat_nos_conseils_lors_du_choix_de_votre_toiture"
    get 'la-toiture/entretien-les-bons-reflexes-pour-entretenir-votre-toiture', on: :collection, controller: "toitures", action: "entretien_les_bons_reflexes_pour_entretenir_votre_toiture"
    get 'la-toiture/les-cles-pour-reussir-la-renovation-de-votre-toit', on: :collection, controller: "toitures", action: "les_cles_pour_reussir_la_renovation_de_votre_toit"
    get 'la-toiture/la-reglementation-et-les-assurances', on: :collection, controller: "toitures", action: "la_reglementation_et_les_assurances"
    get 'la-toiture/comment-bien-choisir-vos-prestataires-professionnels', on: :collection, controller: "toitures", action: "comment_bien_choisir_vos_prestataires_professionnels"

    # guide de la couverture
    get 'la-couverture', on: :collection, controller: "couvertures", action: "index"
    get 'la-couverture/bien-choisir-sa-couverture', on: :collection, controller: "couvertures", action: "bien_choisir_sa_couverture"
    get 'la-couverture/analyse-comparative-materiaux-couverture', on: :collection, controller: "couvertures", action: "analyse_comparative_materiaux_couverture"
    get 'la-couverture/les-tuiles-en-terre-cuite', on: :collection, controller: "couvertures", action: "les_tuiles_en_terre_cuite"
    get 'la-couverture/les-ardoises-naturelles', on: :collection, controller: "couvertures", action: "les_ardoises_naturelles"
    get 'la-couverture/les-bardeaux-de-bois', on: :collection, controller: "couvertures", action: "les_bardeaux_de_bois"
    get 'la-couverture/le-toit-de-chaume', on: :collection, controller: "couvertures", action: "le_toit_de_chaume"
    get 'la-couverture/le-toit-en-zinc', on: :collection, controller: "couvertures", action: "le_toit_en_zinc"
    get 'la-couverture/le-toit-en-lauze', on: :collection, controller: "couvertures", action: "le_toit_en_lauze"
    get 'la-couverture/les-ardoises-synthetiques', on: :collection, controller: "couvertures", action: "les_ardoises_synthetiques"
    get 'la-couverture/les-tuiles-metalliques', on: :collection, controller: "couvertures", action: "les_tuiles_metalliques"
    get 'la-couverture/les-tuiles-en-beton', on: :collection, controller: "couvertures", action: "les_tuiles_en_beton"
    get 'la-couverture/les-bardeaux-bitumineux', on: :collection, controller: "couvertures", action: "les_bardeaux_bitumineux"
    get 'la-couverture/isolation-toiture', on: :collection, controller: "couvertures", action: "isolation_toiture"
    get 'la-couverture/ventilation-toiture', on: :collection, controller: "couvertures", action: "ventilation_toiture"
    get 'la-couverture/ecran-de-sous-toiture', on: :collection, controller: "couvertures", action: "ecran_de_sous_toiture"
    get 'la-couverture/la-zinguerie', on: :collection, controller: "couvertures", action: "la_zinguerie"
    get 'la-couverture/les-ouvertures-de-toit', on: :collection, controller: "couvertures", action: "les_ouvertures_de_toit"
    get 'la-couverture/les-ornements', on: :collection, controller: "couvertures", action: "les_ornements"
    get 'la-couverture/les-panneaux-solaires', on: :collection, controller: "couvertures", action: "les_panneaux_solaires"

    # guide de la toiture
    get 'la-charpente', on: :collection, controller: "charpentes", action: "index"
    get 'la-charpente/choisir-sa-charpente', on: :collection, controller: "charpentes", action: "choisir_sa_charpente"
    get 'la-charpente/les-bois-de-charpente', on: :collection, controller: "charpentes", action: "les_bois_de_charpente"
    get 'la-charpente/la-charpente-traditionnelle', on: :collection, controller: "charpentes", action: "la_charpente_traditionnelle"
    get 'la-charpente/la-charpente-a-fermettes-industrielles', on: :collection, controller: "charpentes", action: "la_charpente_a_fermettes_industrielles"
    get 'la-charpente/la-charpente-en-beton', on: :collection, controller: "charpentes", action: "la_charpente_en_beton"
    get 'la-charpente/la-charpente-metallique', on: :collection, controller: "charpentes", action: "la_charpente_metallique"

  end
end



