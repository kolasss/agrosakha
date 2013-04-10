Agro14::Application.routes.draw do
  resources :subcategories
  resources :categories
  resources :cities
  resources :regions

  # authenticated :user do
  #   root :to => 'home#index'
  # end
  root :to => "home#index"
  
  devise_for :users
  resources :users
end