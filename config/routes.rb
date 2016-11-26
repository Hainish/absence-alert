Rails.application.routes.draw do
  root 'static#index'

  resources :message_categories
  resources :messages
end
