# frozen_string_literal: true

Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  get 'users/index'
  get 'users/show'
  root to: 'users#index'
  resources :users do
    resources :foods, only: [:index, :destroy, :create, :new]
    resources :recipes, only: [:index, :destroy, :create, :new]
  end
end
