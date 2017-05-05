Rails.application.routes.draw do
  get 'magazines/index'

  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  resources :users
  resources :projects
  resources :clients, only: [:new, :create, :show]
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # partie magazine
  resources :magazine, only: [ :index ] do
    get 'energie', on: :collection, controller: "energies", action: "index"
    get 'energie/photovoltaique_2017', on: :collection, controller: "energies", action: "photovoltaique_2017"
  end


  # Partie guides
  get 'guides', to: 'guides#index'


end



