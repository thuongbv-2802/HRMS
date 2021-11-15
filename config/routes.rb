Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  get 'home', to: 'static_pages#home'
  get 'help', to: 'static_pages#help'
  root 'static_pages#home'
end
