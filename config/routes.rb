Rails.application.routes.draw do
  get 'furimas/index'
  root to: "furimas#index"
  devise_for :users
  resources :furimas, only: [:new, :create, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end