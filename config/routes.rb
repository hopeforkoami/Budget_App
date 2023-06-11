Rails.application.routes.draw do
  devise_for :users
  
  resources :splash, only: [:index, :logout]
  resources :group do
    resources :payment
  end

  resources :not_found, only: [:index]
  get 'logout', to: 'splash#logout'
  # Defines the root path route ("/")
  # root "articles#index"
  root 'splash#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
