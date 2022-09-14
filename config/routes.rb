Rails.application.routes.draw do
  resources :bots
  root 'dashboard#index'
  devise_for :users
  
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
