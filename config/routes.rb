# frozen_string_literal: true

Rails.application.routes.draw do
  post "users/:user_id/recipes/:id", to: "recipes#toggle"
  root to: 'users#index'
  resources :users do
    resources :foods
    resources :recipes
  end
end
