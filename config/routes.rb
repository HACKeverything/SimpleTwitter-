Rails.application.routes.draw do

  root to: "users#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create] do
    member do 
      get "follow"
    end
  end
  resources :statuses, only: [:new, :create]

  get "/:username", to: "users#show", as: "user"
end
