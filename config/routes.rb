Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  get "profile", to: "pages#profile", as: :profile
  resources :goals
  resources :credit_cards, except: :index
  resources :transactions
end
