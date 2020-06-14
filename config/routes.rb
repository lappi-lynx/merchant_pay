Rails.application.routes.draw do
  devise_for :users
  resources :merchants, except: %i[new create]

  root to: 'merchants#index'

  namespace :api do
    post 'authenticate', to: 'authentication#authenticate'

    namespace :v1, defaults: { format: 'json' } do
      post 'transactions', to: 'transactions#create'
    end
  end
end
