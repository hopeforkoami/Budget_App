Rails.application.routes.draw do
  devise_for :users
  
  resources :splash, only: [:index]
  resources :groups do
    resources :payment
  end

  resources :not_found, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"
  root 'group#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
