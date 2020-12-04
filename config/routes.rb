Rails.application.routes.draw do

  get 'ingredients/index'
  get 'ingredients/new'
  get 'ingredients/create'
  resources :recipes, except: %i[edit update destroy]
end
