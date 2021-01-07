Rails.application.routes.draw do
  root 'sessions#new'
  resources :followings

  resources :talks do
    resources :likes, only: %i[create destroy]
  end

  resources :users
  resources :sessions, only: %i[new create destroy]
end
