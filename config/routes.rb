Rails.application.routes.draw do
  root to: 'promos#index'

  get 'promos/new/', to: 'promos#new'
  get 'promos/:id/', to: 'promos#denied'
  resources :promos do
    get '/:access_token', to: 'promos#show', as: 'access'
  end
end
