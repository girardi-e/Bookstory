Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :books
  resources :orders, only: [:show, :create]
end
