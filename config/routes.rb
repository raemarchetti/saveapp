Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  resources :goals
  resources :users
  resources :credit_cards
  resources :transactions

end
