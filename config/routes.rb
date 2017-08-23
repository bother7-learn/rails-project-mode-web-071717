Rails.application.routes.draw do
  resources :user_teams, only: [:index, :new, :show, :create]
  resources :matches, only: [:new, :show, :create]
  resources :leagues, only: [:index, :show]
  resources :players, only: [:new, :create, :show, :index]
  resources :teams, only: [:index, :show]
  resources :users, only: [:show, :new, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
