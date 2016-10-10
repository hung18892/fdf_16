Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"  
  resources :users
  resources :categories, only: [:index]
  resources :products
  resources :suggests, only: [:create, :new, :index]
  namespace :admin do
    resources :products
    resources :categories
    resources :users
    resources :suggests, only: [:index]
  end
end
