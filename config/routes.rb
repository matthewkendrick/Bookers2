Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'users/update'
  get 'users/edit'
  get 'books/new'
  get 'books/create'
  get 'books/show'
  get 'books/index'
  get 'books/update'
  get 'books/edit'
  get 'books/destroy'
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
