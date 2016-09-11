Rails.application.routes.draw do
  resources :categories
  resources :non_profits
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
