Rails.application.routes.draw do
  devise_for :users
  root "trips#new"

  resources :trips, only:[:index, :show, :new, :create, :edit, :update] do
    resources :transports, only: [:index]
    get "transport_type", to: "trips#add_transport", as: "add_transport"
  end
  # resources :transport, only: [:update]

  resources :compensation_trip, only: [:create]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/directions", to: "maps#directions"

  # Defines the root path route ("/")
  # root "posts#index"
end
