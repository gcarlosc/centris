Rails.application.routes.draw do

  root to: 'products#index'

  resources :products
  resources :category_products, only: [:create, :new, :index]

end
