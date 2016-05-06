  Rails.application.routes.draw do
  root "static_pages#home"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "signup" => "users#new"
  
  resources :users, only: [:new, :create]

  namespace :admin do
    resources :subjects
  end
end
