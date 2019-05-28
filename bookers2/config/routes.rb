Rails.application.routes.draw do
  
  get 'home/top'
  get 'home/about'
  devise_for :users

  resources :books
  #get 'books/create'
  #get 'books/edit'
  #get 'books/update'
  #get 'books/show'
  #get 'books/index'
  #get 'books/destroy'
  resources :users, only:[:index, :show, :edit, :update]

  #get 'users/edit'
  #get 'users/index'
  #get 'users/show'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
end
