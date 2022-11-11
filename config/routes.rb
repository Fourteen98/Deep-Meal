# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  post "users/:user_id/recipes/:id", to: "recipes#toggle"
  root to: 'users#index'
  resources :users do
    resources :foods
    resources :recipes
  end
end
