Rails.application.routes.draw do
  root to: 'books#index'
  resources :books do
  collection do
    get 'events', to: 'books#events'
  end
 end
end
