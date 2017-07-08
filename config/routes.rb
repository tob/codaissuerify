Rails.application.routes.draw do

  resources :artists do
    resources :songs, only: [:create, :destroy]
  end

end
