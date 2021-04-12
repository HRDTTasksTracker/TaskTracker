# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'sessions#welcome'

  resources :tasks
  resources :valid_emails
  resources :users # , only: [:new, :create]
  resources :roles

  # get 'whitelist/new' to: ''
  get 'login', to: 'sessions#new'
  get 'filtered', to: 'tasks#filtered'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#logout'
  get 'authorized', to: 'sessions#page_requires_login'
  get '/index', to: 'pages#index'
end
