Rails.application.routes.draw do
  devise_for :users
  root to: "offers#index"

  resources :offers, only: [:index, :show, :new, :create, :Destory] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]

  get "dashboard", to: "pages#dashboard", as: :dashboard
end
