Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:index, :create]
    resources :helicopter, only: [:index, :create]
    post "/api/reservation", to: "reservations#create"
    get "/api/reservations", to: "reservations#index"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
