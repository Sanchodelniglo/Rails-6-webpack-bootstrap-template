Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'

  resources :challenges, only: %i[new create show] do
    resources :user_challenges, only: %i[update]
    get 'user_challenges', to: 'user_challenges#create'
    resources :invitations, only: %i[new edit]
    resources :restaurants, only: %i[index create]
    resources :questions, only: %i[index]
  end

  get 'answers/:id/', to: 'answers#compute_score', as: 'compute_score'
end
