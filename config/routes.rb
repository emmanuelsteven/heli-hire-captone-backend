Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:index, :create]
    resources :helicopter, only: [:index, :create, :destroy]
    post "/api/reservation", to: "reservations#create"
    get "/api/reservations", to: "reservations#index"
    delete "/api/reservations/:id", to: "reservations#destroy"

  end
end
