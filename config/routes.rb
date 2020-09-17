Rails.application.routes.draw do
  devise_for :members
  resources :members, only: [:show]

  resources :posts

  root 'feed#index'
end
