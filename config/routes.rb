Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  get 'furimas/index'
  root to: "furimas#index"
  resources :furimas, except: [:index] do
   resources :purchases, only: [:index, :create]
  end
  resources :users, only: :show 
  
 end