Rails.application.routes.draw do
  get 'payment/index'
  get 'payment/new'
  get 'payment/create'
  get 'payment/destroy'
  get 'group/index'
  get 'group/show'
  get 'group/new'
  get 'group/create'
  get 'group/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
