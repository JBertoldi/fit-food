Rails.application.routes.draw do

  resources :recipes, except: %i[edit update destroy]
end
