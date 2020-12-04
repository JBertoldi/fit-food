Rails.application.routes.draw do
  root to: 'recipes#index'

  devise_for :users

  resources :recipes, except: %i[destroy] do
    resources :doses
  end

  resources :ingredients, only: %i[index new create]
end
