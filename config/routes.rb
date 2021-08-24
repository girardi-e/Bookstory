Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :books do
    resources :orders, only: [:create]
  end
  resources :orders, only: [:show]
  get '/profile', to: 'pages#profile'
  get '/bought_books', to: 'pages#bought_books'
end
