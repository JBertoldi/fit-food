Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  get '/profile', to: 'pages#profile'

  resources :recipes, except: :new do
    resources :doses, only: %i[new create destroy]
  end

  resources :ingredients, only: %i[index new create]

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unacceptable', via: :all
  match '/500', to: 'errors#internal_error', via: :all
end
