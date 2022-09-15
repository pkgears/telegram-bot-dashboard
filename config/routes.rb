Rails.application.routes.draw do
  resources :chats
  root 'dashboard#index'
  
  devise_for :users

  resources :bots do
    member do
      post "send_message"
    end
  end

  
end
