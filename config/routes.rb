Rails.application.routes.draw do
  get 'memberships/create'

  get 'memberships/destroy'

  root to: 'pages#home'
  get '/search', to: 'pages#search'
  get '/profile', to: 'pages#profile'

  devise_for :users

  resources :groups
  resources :invitations, only: [:create, :destroy]
end
