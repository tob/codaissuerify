Rails.application.routes.draw do
  root to: 'artists#index'

  resources :artists do
    resources :songs, only: [:create, :destroy]

    namespace :api do
      resources :songs, only: [:create, :destroy, :index]
    end
  end
end
