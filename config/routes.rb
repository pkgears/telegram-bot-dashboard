Rails.application.routes.draw do
  root 'dashboard#index'
  
  devise_for :users
  
  resources :chats do
    member do
      post "send_message"
    end
  end
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
