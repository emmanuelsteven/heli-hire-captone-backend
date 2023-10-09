Rails.application.routes.draw do
  namespace :api do
    post 'register', to: 'users#register'
    post 'login', to: 'users#login'
    
    resources :users, only: [] do
      resources :reservations, only: [:index, :create, :destroy]
    end
    resources :reservations, only: [:destroy]
    resources :helicopter, only: [:index, :create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end