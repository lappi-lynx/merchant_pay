Rails.application.routes.draw do
  devise_for :users
  resources :merchants, except: %i[new create]

  root to: 'merchants#index'
end
