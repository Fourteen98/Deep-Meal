# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # , skip: :all
  root to: 'users#index'
  post "users/:user_id/recipes/:id", to: "recipes#toggle"

  resources :users do
    resources :foods
    resources :recipes
  end
end
