Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :books do
    resources :orders, only: [:show, :create]
  end

end
