Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :offers, only: [:index, :show, :new, :create, :destroy]   do # Need to check "offer#destroy route"
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :bookings, only: [:update, :destroy]
  resources :reviews, only: [:destroy]

  get "my_bookings", to: "pages#my_bookings", as: :my_bookings
  get "my_offers", to: "pages#my_offers", as: :my_offers
end
