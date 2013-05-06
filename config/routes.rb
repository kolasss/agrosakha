Agro14::Application.routes.draw do
  resources :posts
  resources :profiles
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
  root :to => "posts#index"
  
  devise_for :users
  resources :users

  match "/sells/category/:id", to: "sells#show_category", :as => :sells_category
  match "/sells/subcategory/:id", to: "sells#show_subcategory", :as => :sells_subcategory
  match "/buys/category/:id", to: "buys#show_category", :as => :buys_category
  match "/buys/subcategory/:id", to: "buys#show_subcategory", :as => :buys_subcategory
end