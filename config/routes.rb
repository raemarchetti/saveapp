Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  get "profile", to: "pages#profile", as: :profile
  resources :goals
  resources :credit_cards, except: :index do
    resources :operations, only: [:index, :new, :create]
  end

  resources :operations, only: [:edit, :update, :show, :destroy]
  resources :roundups
end
