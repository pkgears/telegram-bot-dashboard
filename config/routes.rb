Rails.application.routes.draw do
  root 'dashboard#index'
  
  devise_for :users

  resources :bots do
    member do
      post "send_message"
    end
  end
  
end
