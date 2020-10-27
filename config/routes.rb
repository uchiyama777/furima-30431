Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'purchases/index'
  devise_for :users
  get 'furimas/index'
  root to: "furimas#index"
  resources :furimas, only: [:new, :create, :show, :edit, :update, :destroy] do
   resources :purchases, only: [:create, :index]
  end
  resources :users, only: :show 
  
 end