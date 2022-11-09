# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  root to: 'users#index'
  resources :users do
    resources :foods, only: [:index, :destroy, :create, :new]
  end
end
