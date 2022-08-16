Rails.application.routes.draw do
  devise_for :users
  root to: "offers#index"
end
