Skuvo::Application.routes.draw do
  root :to => "static_pages#index"
  resources :users, :only => [:new, :create, :show]
  resources :photos, :only => [:create, :destroy]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :albums, :only => [:show, :destroy]

  get 'user/:username' => "users#show", :as => "username"
  get 'a/:url' => "albums#show", :as => "album_url"
  get 'i/:short_url' => "photos#show", :as => "photo_url"
  get 'signup' => "users#new", :as => "signup"
  get "login" => "sessions#new", :as => "login"
  get "about" => "static_pages#about", :as => "about"
  get "terms" => "static_pages#terms", :as => "terms"
  match ':short_url' => 'photos#go'
end
