Rails.application.routes.draw do
  root to: 'pages#home'

  get '/profile', to: 'pages#profile'

  devise_for :users

  resources :recipes, except: :new do
    member do
      patch :publish
    end

    resources :doses, only: %i[new create destroy]
    resources :favourites, only: %i[create destroy]
  end

  resources :ingredients, only: %i[index new create]

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unacceptable', via: :all
  match '/500', to: 'errors#internal_error', via: :all
end
