Rails.application.routes.draw do
  resources :albums
  namespace :api do
    namespace :v1 do

      get "/login", to: "auth#spotify_request"
      get "/auth", to: "auth#show"

      resources :rankings
      resources :songs
      resources :users
      resources :albums
      
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
