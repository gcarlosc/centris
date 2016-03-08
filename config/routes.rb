Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  get "sign_up" => "users#new", :as => "sign_up"
  get "sign_in" => "session#new", :as => "sign_in"
  root to: 'sessions#new'

  resources :products
  resources :category_products, only: [:new, :index]
  resources :descriptions, only: [:create, :new, :index]
  resources :skus, only: [:create, :new, :index]
  resources :projects, only: [:new, :index]
  resources :warehouses, only: [:new, :index] do
    get :stock, on: :collection
  end
  resources :suppliers, only: [:new, :index]
  resources :storekeepers
  resources :movement_types, only: [:new] do
    resources :movements, only: [:new, :create, :edit]
  end
  resources :movements do
    resources :skus do
      put :update_warehouse, on: :collection
      put :update_status, on: :collection
    end
  end
end
