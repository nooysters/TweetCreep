Rails.application.routes.draw do
  devise_for :users
  
  root 'pages#index'
  
  get 'update', to: 'pages#update', as: 'update'  
 end
