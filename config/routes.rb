Rails.application.routes.draw do

  resources :recipes, except: %i[edit update destroy]

  resources :ingredients, only: %i[index new create]
end
