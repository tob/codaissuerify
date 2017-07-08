Rails.application.routes.draw do
  root to: 'pages#home'

    resources :artists
    resources :songs, except: [:destroy]

end
