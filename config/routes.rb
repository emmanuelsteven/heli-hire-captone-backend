Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    post 'register', to: 'users#register'
    post 'login', to: 'users#login'
    resources :users, only: [] do
      resources :reservations, only: [:index, :create, :destroy]
    end
    resources :reservations, only: [:destroy]
    resources :helicopter, only: [:index, :create]
  end
end