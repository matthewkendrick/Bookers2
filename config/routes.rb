Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about'

  resources :books, only: [:show, :edit, :create, :index, :destroy, :update]
  resources :users, only: [:show, :create, :index, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
