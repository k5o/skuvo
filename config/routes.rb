Skuvo::Application.routes.draw do
  root :to => "static_pages#index"
  resources :users, :only => [:new, :create, :show]
  resources :photos
  resources :sessions, :only => [:new, :create, :destroy]

  
  get 'user/:username' => "users#show", :as => "username"
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "about" => "static_pages#about", :as => "about"
  get "terms" => "static_pages#terms", :as => "terms"
  get "demo" => "static_pages#demo", :as => "demo"
  match ':short_url' => 'photos#go'
end
