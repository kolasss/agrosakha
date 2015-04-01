Agro14::Application.routes.draw do
  resources :ga_pageviews_records
  resources :posts
  resources :feeds
  resources :profiles
  resources :buys
  resources :count_types
  resources :sells
  resources :subcategories
  resources :categories
  resources :cities
  resources :regions

  # root :to => "posts#index"
  root :to => "sells#index"

  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users

  match "/sells/category/:id", to: "sells#show_category", :as => :sells_category
  match "/sells/subcategory/:id", to: "sells#show_subcategory", :as => :sells_subcategory
  match "/buys/category/:id", to: "buys#show_category", :as => :buys_category
  match "/buys/subcategory/:id", to: "buys#show_subcategory", :as => :buys_subcategory
  match "/profiles/category/:id", to: "profiles#show_category", :as => :profiles_category
  match "/profiles/subcategory/:id", to: "profiles#show_subcategory", :as => :profiles_subcategory

  match '/profiles/update_city_select/:id', :controller=>'profiles', :action => 'update_city_select'
  match '/sells/update_city_select/:id', :controller=>'sells', :action => 'update_city_select'
  match '/buys/update_city_select/:id', :controller=>'buys', :action => 'update_city_select'

  match '/sells/update_subcat_select/:id', :controller=>'sells', :action => 'update_subcat_select'
  match '/buys/update_subcat_select/:id', :controller=>'buys', :action => 'update_subcat_select'
end
