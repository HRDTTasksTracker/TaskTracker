Rails.application.routes.draw do
  get 'tasks/show'
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/index", to: "pages#index"
  #root to: 'pages#index/home'
end
