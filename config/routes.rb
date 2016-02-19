Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  get '/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe'
  resources :users, only: :create
end
