# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  # , skip: :all
  root to: 'public_recipes#index'
  post "users/:user_id/recipes/:id", to: "recipes#toggle"

  resources :users do
    resources :foods
    resources :recipes
    resources :public_recipes
  end
end
