Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  get '/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe'
  get '/welcome', to: 'users#welcome', as: 'welcome'
  get '/welcome_back', to: 'users#welcome_back', as: 'welcome_back'
  resources :users, only: :create
end
