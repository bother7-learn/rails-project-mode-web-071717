Rails.application.routes.draw do
  root :to => 'users#home', as: 'home'
  resources :user_teams
  resources :matches, only: [:new, :show, :create]
  resources :leagues, only: [:index, :show]
  resources :players
  resources :teams, only: [:index, :show]
  get '/signup', to: 'users#new', as: 'signup'
  resources :users, only: [:show, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
