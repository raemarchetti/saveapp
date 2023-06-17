Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # get "dashboard", to: "pages#dashboard"
  get "contact", to: "pages#contact"
  get "profile", to: "pages#profile", as: :profile
  get "welcome", to: "pages#welcome", as: :welcome

  resources :goals

  resources :credit_cards
  # , except: :index

  resources :credit_cards, except: :index do
    resources :operations, only: [:index, :new, :create]
  end

  resources :operations, only: :show
end
