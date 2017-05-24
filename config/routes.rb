Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  resources :users
  resources :projects
  resources :clients, only: [:new, :create, :show, :edit, :update]

  mount Attachinary::Engine => "/attachinary"
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
    get 'la-toiture/element-essentiel-de-votre-maison', on: :collection, controller: "toitures", action: "introduction"
    get 'la-toiture/composition', on: :collection, controller: "toitures", action: "composition"
    get 'la-toiture/types-de-toit', on: :collection, controller: "toitures", action: "types_de_toit"
    get 'la-toiture/achat', on: :collection, controller: "toitures", action: "achat"
    get 'la-toiture/entretien', on: :collection, controller: "toitures", action: "entretien"
    get 'la-toiture/renovation', on: :collection, controller: "toitures", action: "renovation"
    get 'la-toiture/reglementation', on: :collection, controller: "toitures", action: "reglementation"
    get 'la-toiture/professionnels', on: :collection, controller: "toitures", action: "professionnels"


    # guide de la couverture
    get 'la-couverture', on: :collection, controller: "couvertures", action: "index"
    get 'la-couverture/introduction', on: :collection, controller: "couvertures", action: "introduction"

    # guide de la toiture
    get 'la-charpente', on: :collection, controller: "charpentes", action: "index"
    get 'la-charpente/introduction', on: :collection, controller: "charpentes", action: "introduction"

  end

  #partie pages statiques charpentegh-voltage
  get "/*id" => 'pages#show', as: :page, format: false
end



