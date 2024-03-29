require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "sessions#new"
  end

  resources :categories, only: [:create, :destroy, :index, :show]
  resources :expenses, except: [:new]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:show]
end
