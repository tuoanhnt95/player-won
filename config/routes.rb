Rails.application.routes.draw do
  devise_for :users
  root to: "offers#index"

  resources :offers, only: [:index, :show, :new, :create, :destroy]   do # Need to check "offer#destroy route"
    resources :bookings, only: [ :create]
  end
  resources :bookings, only: [:destroy]

  get "dashboard", to: "pages#dashboard", as: :dashboard
end
