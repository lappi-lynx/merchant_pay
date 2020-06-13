Rails.application.routes.draw do
  devise_for :users
  root to: 'merchants#index'

  resources :merchants, except: %i[new create]
end
