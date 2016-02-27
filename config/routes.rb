Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  get "sign_up" => "users#new", :as => "sign_up"
  get "sign_in" => "session#new", :as => "sign_in"
  root to: 'sessions#new'

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
