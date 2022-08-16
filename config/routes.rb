Rails.application.routes.draw do
  devise_for :users
  root to: "offers#index"

  resources :offers, only: [:index, :show, :new, :create, :Destory] do
    resources :bookings, only: [:index, :new, :create]
  end
  resources :bookings, only: [:destroy]
end
