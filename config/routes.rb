Rails.application.routes.draw do

  root to: 'guides#new'

  resources :products
  resources :category_products, only: [:create, :new, :index]
  resources :descriptions, only: [:create, :new, :index]
  resources :skus, only: [:create, :new, :index]
  resources :projects, only: [:create, :new, :index]
  resources :warehouses, only: [:create, :new, :index]
  resources :suppliers, only: [:create, :new, :index]
  resources :storekeepers
  resources :guides do
    get 'new_interno' => 'guides#new_interno', on: :collection
    get 'new_traspaso' => 'guides#new_traspaso', on: :collection
  end
end
