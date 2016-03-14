class SubdomainConstraint
  def self.matches?(request)
    subdomains =%w{ www admin }
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end

Rails.application.routes.draw do

  constraints SubdomainConstraint do
    resource :session, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create]
    get "sign_up" => "users#new", :as => "sign_up"
    get "sign_in" => "session#new", :as => "sign_in"
    root to: 'sessions#new'

    resources :products
    resources :category_products, only: [:new, :create, :index]
    resources :descriptions, only: [:create, :new, :index]
    resources :skus, only: [:create, :new, :index]
    resources :projects
    resources :warehouses do
      get :stock, on: :collection
      get :skus_show, on: :collection
    end
    resources :suppliers
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

  root to: 'home#index', as: :home
end
