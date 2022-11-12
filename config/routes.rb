# frozen_string_literal: true

Rails.application.routes.draw do
  get 'recipe_foods/index'
  get 'recipe_foods/new'
  get 'recipe_foods/create'
  get 'recipe_foods/destroy'
  get 'users/index'
  devise_for :users
  # , skip: :all
  root to: 'public_recipes#index'
  post "users/:user_id/recipes/:id", to: "recipes#toggle"

  resources :users do
    resources :foods
    resources :recipes do
      resources :recipe_foods
    end
    resources :public_recipes
  end
end
