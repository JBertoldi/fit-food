Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  get 'profile', to: 'pages#profile'

  resources :recipes do
    resources :doses, only: %i[new create destroy]
  end

  resources :ingredients, only: %i[index new create]
end
