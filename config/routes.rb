Rails.application.routes.draw do
  get 'memberships/create'
  get 'memberships/destroy'

  root to: 'pages#profile'
  get '/search', to: 'pages#search'
  get '/profile', to: 'pages#profile'

  post '/check_invitation', to: 'invitations#check_invitation'

  devise_for :users

  resources :groups do
    resources :posts, only: [:create]
    resources :receipts
  end
  resources :invitations, only: [:create, :destroy]
end
