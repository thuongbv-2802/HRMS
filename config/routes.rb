Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users
  get 'signup', to: 'users#new'
  get 'home', to: 'static_pages#home'
  get 'help', to: 'static_pages#help'
  root 'static_pages#home'
end
