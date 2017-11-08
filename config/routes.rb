Rails.application.routes.draw do
  resources :contests, only: [:index, :show] do
    post ':type', on: :collection, to: 'contests#create', as: 'create'

    member do
      resources :contest_events, path: 'events', only: :index
    end
  end
  resources :contest_types, only: :index
  resources :users, only: [:create]

end
