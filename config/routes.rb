Rails.application.routes.draw do

  devise_for :admin_users, path: 'da-vinci/sessions', controllers: {
      sessions: 'admin_users/sessions'
  }

  authenticate :admin_user do
    namespace 'admin', path: 'da-vinci' do
      resources :admin_users
      resources :users
      resources :omdb_items
      resources :polls

      root to: "omdb_items#index"
    end
  end

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :api do
    get 'search/index'
    get 'search/item'
  end

  resources :movies
end
