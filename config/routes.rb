Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/show'
  get 'offers/index'
  get 'offers/show'
  devise_for :users
  root to: "pages#home"
end
