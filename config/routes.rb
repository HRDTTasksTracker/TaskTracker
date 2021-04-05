# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'sessions#welcome'

  resources :tasks
  resources :valid_emails, only: %i[new create index]
  resources :users # , only: [:new, :create]

  # get 'whitelist/new' to: ''
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#logout'
  get 'authorized', to: 'sessions#page_requires_login'
  get '/index', to: 'pages#index'
end
