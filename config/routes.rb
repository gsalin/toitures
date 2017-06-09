  Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  resources :users
  resources :projects
  resources :clients, only: [:new, :create, :show, :edit, :update]
  resources :articles, only: [:index, :new, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # partie magazine
  get 'magazines/index'
  resources :magazine, only: [ :index ] do
    get 'energie', on: :collection, controller: "energies", action: "index"
    get 'energie/photovoltaique_2017', on: :collection, controller: "energies", action: "photovoltaique_2017"
  end

  # Partie guides
  get 'guides', to: 'guides#index'
  resources :guide, only: [ :index ] do

    # guide de la toiture
    get 'la-toiture', on: :collection, controller: "toitures", action: "index"
    get 'la-toiture/financement', on: :collection, controller: "toitures", action: "financement"
    get 'la-toiture/composition', on: :collection, controller: "toitures", action: "composition"
    get 'la-toiture/types-de-toit', on: :collection, controller: "toitures", action: "types_de_toit"
    get 'la-toiture/achat', on: :collection, controller: "toitures", action: "achat"
    get 'la-toiture/entretien', on: :collection, controller: "toitures", action: "entretien"
    get 'la-toiture/renovation', on: :collection, controller: "toitures", action: "renovation"
    get 'la-toiture/reglementation', on: :collection, controller: "toitures", action: "reglementation"
    get 'la-toiture/professionnels', on: :collection, controller: "toitures", action: "professionnels"


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

    # guide de la toiture
    get 'la-charpente', on: :collection, controller: "charpentes", action: "index"
    get 'la-charpente/introduction', on: :collection, controller: "charpentes", action: "introduction"

  end
end



