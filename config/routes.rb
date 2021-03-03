Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'

  resources :challenges, only: %i[new create] do
    resources :user_challenges, only: %i[update]
    resources :invitations, only: %i[new]
    resources :restaurants, only: %i[index create]
    resources :questions, only: %i[index]
  end

  resources :answers, only: %i[show]
end
