Rails.application.routes.draw do
  root to: 'pages#home'
  get '/search', to: 'pages#search'

  devise_for :users

  resources :groups
end
