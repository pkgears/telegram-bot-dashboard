Rails.application.routes.draw do
  resources :chats
  root 'dashboard#index'
  
  devise_for :users

  resources :bots do
    member do
      post "send_message"
      post "start"
      post "stop"
    end
  end

  namespace :api do
    resources :chats, only: [:show, :create]
  end
end
