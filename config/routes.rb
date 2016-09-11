Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'


  resources :categories
  resources :non_profits
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
