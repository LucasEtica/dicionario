Rails.application.routes.draw do
  resources :termos
  resources :usuarios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  get 'login', to: 'sessions#new', as: 'login'  # For showing the login form
  post 'login', to: 'sessions#create', as: 'sessions'  # For submitting the login form
  get 'logout', to: 'sessions#logout', as: 'logout'  # For logging out

  root "termos#index"
end
