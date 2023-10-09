Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:index, :create]
    resources :helicopter, only: [:index, :create, :destroy]
    resources :reservations, only: [:index, :create, :destroy]

  end
end
