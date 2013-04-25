Agro14::Application.routes.draw do
  resources :buys
  resources :count_types
  resources :sells
  resources :subcategories
  resources :categories
  resources :cities
  resources :regions

  # authenticated :user do
  #   root :to => 'home#index'
  # end
  root :to => "sells#index"
  
  devise_for :users
  resources :users

  match "/sells/category/:id", to: "sells#show_category", :as => :sells_category
  match "/sells/subcategory/:id", to: "sells#show_subcategory", :as => :sells_subcategory
end