Rails.application.routes.draw do
  root to: 'static_pages#home'

  namespace :api, default: { format: :json } do
    resources :recipes
    resources :ingredients
  end

  devise_for :users

  get 'static_pages/about'
end
