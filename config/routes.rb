Rails.application.routes.draw do

  root to: 'guides#new'

  get 'new_interno' => 'guides#new_interno'

  get 'new_traspaso' => 'guides#new_traspaso'

  resources :products
  resources :category_products, only: [:create, :new, :index]
  resources :descriptions, only: [:create, :new, :index]
  # resources :organizations, only: [:index]
  resources :projects, only: [:create, :new, :index]
  resources :warehouses, only: [:create, :new, :index]
  resources :suppliers, only: [:create, :new, :index]
  resources :storekeepers
  resources :guides
end
