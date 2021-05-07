Rails.application.routes.draw do
  resources :items
  resources :users do
    member do
      post :remove_items, to: 'users#remove_items'
    end
  end
  resources :subscribers
  resources :carts do
    member do
      post :remove_items, to: 'carts#remove_items'
    end
  end
  
  post :add_to, to: 'carts#add_to'
  
  get 'main/main'

  get 'main/about'

  get 'main/contact'
  
  get 'main/productdetails'
  
  get 'main/checkout'
  
  get 'newsletter_signup', to: 'subscribers#new'
  post 'newsletter_signup', to: 'subscribers#create'

  root 'main#main'
end
