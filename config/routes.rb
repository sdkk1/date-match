Rails.application.routes.draw do
  root 'static_pages#home'

  get :signup,       to: 'users#new'
  resources :users do
    member do
      get :following, :followers
    end
  end

  post 'guest_login', to: 'sessions#new_guest'
  get    :login,     to: 'sessions#new'
  post   :login,     to: 'sessions#create'
  delete :logout,    to: 'sessions#destroy'

  resources :rooms, only: [:create, :show, :index] do
    resources :messages, only: [:create, :destroy]
  end

  resources :datespots do
    resources :comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:create]

  get :favorites, to: 'favorites#index'
  post   "favorites/:datespot_id/create"  => "favorites#create"
  delete "favorites/:datespot_id/destroy" => "favorites#destroy"

  resources :notifications,　only: [:index, :destroy]

  get :lists, to: 'lists#index'
  get   "lists/my_lists" => "lists#my_index"
  post   "lists/:datespot_id/create" => "lists#create"
  delete "lists/:list_id/destroy"    => "lists#destroy"

  resources :browsing_histories,　only: [:index]
end
