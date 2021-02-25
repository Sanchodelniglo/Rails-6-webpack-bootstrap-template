Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'

  resources :challenges, only: %i[new create] do
    resources :restaurants, only: [:index]
  end
end
