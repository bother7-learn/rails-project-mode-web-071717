Rails.application.routes.draw do
  root :to => 'users#home', as: 'home'
  resources :user_teams, only: [:index, :new, :show, :create, :edit, :update]
  resources :matches, only: [:new, :show, :create]
  resources :leagues, only: [:index, :show]
  resources :players, only: [:new, :create, :show, :index, :edit, :update]
  resources :teams, only: [:index, :show]
  get '/signup', to: 'users#new', as: 'signup'
  resources :users, only: [:show, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
