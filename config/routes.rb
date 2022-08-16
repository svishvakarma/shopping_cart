Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "buyers#index"

  resources :sellers  
  resources :buyers
  resources :carts
  resources :lineitems
  resources :home

  get "/payment" ,to: "lineitems#payment" 
  get "/mydash" ,to: "sellers#mydash" 
  patch "/payment_type" ,to: "lineitems#payment_type"
end
