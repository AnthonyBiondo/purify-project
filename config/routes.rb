Rails.application.routes.draw do
  devise_for :users
  root "trips#new"

  resources :trips, only:[:index, :show, :new, :create, :edit, :update] do
    resources :transports, only: [:index]
  end
  resources :compensations, only: [:show] do
    resources :compensation_trips, only: [:create]
  end

  get "transport_type", to: "trips#add_transport", as: "add_transport"
  # resources :transport, only: [:update]

  get "transport", to: "transports#add_co2_to_transport", as: "add_co2"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/directions", to: "maps#directions"
  get "/users/account", to: "pages#account"
  # Defines the root path route ("/")
  # root "posts#index"
end
