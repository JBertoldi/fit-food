Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :recipes, except: %i[destroy] do
    resources :doses
  end

  resources :ingredients, only: %i[index new create]
end
