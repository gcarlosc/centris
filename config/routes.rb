Rails.application.routes.draw do

  root to: 'products#new'

  resources :products
  resources :category_products, only: [:create, :new, :index]
  resources :descriptions, only: [:create, :new, :index]
  resources :skus, only: [:create, :new, :index]
  resources :projects, only: [:create, :new, :index]
  resources :warehouses, only: [:create, :new, :index]
  resources :suppliers, only: [:create, :new, :index]
  resources :storekeepers
  resources :movement_types do
    resources :movements
  end
end
