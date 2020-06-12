Rails.application.routes.draw do
  root to: 'merchants#index'

  resources :merchants, except: %i[new create]
end
