# frozen_string_literal: true

Rails.application.routes.draw do
  resources :expanses
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'main#dashboard'
  # get 'people/:id', to: 'static#person'
  post 'search_user', to: 'users#search'
  post 'search_users', to: 'main#search_res'
  get 'search_users', to: 'users#search_res'
  post 'add_friend/:id', to: 'users#add_friend', as: 'add_friend'
  get 'friend/:id', to: 'main#friend_dash', as: 'friend'
end
