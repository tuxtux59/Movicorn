Rails.application.routes.draw do

  namespace :admin do
      resources :admin_users
      resources :users
      resources :omdb_items
      resources :polls

      root to: "admin_users#index"
    end
  devise_for :admin_users
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :api do
    get 'search/index'
    get 'search/item'
  end

  resources :movies
end
