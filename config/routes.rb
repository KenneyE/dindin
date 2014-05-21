Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :recipes
  
  devise_for :users

  get 'static_pages/about'
end
