Rails.application.routes.draw do
  root :to => 'visitors#index'
  devise_for :users
  get 'users/index'
  get 'users/show'
  
end