Rails.application.routes.draw do
  get 'login/update_details'

  get 'main/profile'

  get 'main/all_collection'

  get 'login/logout'
  get 'main/rating'

  get 'main/collection'

  get 'main/savedlist'
  get 'login/login' => 'login#login'
  get 'login/sign_up' => 'login#sign_up'
  get 'login/update_details' => 'login#update_details'
  
  post 'login/sign_up' => 'login#sign_up'
  post 'login/login' => 'login#login'
  post 'login/update_details' => 'login#update_details'
  
  post 'main/all_collection' => 'main#all_collection'
  
  resources :items
  resources :users do
    member do
      post :remove_items, to: 'users#remove_items'
    end
  end
  resources :subscribers
  resources :carts
  
  post :remove_items, to: 'carts#remove_items'
  post :remove_item, to: 'carts#remove_item'

  post :filter_saved, to: 'main#filter_saved'
  post :searched, to: 'main#searched'
  
  post :toggle_subscriber, to: 'subscribers#toggle_subscriber'
  post :toggle_saved, to: 'main#toggle_saved'
  post :add_rating, to: 'users#add_rating'
  
  post :to_saved, to: 'main#to_saved'
  
  post :removed_saved, to: 'main#removed_saved'
  
  post :to_productdetails, to: 'main#to_productdetails'
  
  post :add_to, to: 'carts#add_to'
  
  post :add_to_with_param, to: 'carts#add_to_with_param'
  
  get 'main/main' => 'main#main'
  post 'main/main' => 'main#main'

  get 'main/about'

  get 'main/contact'
  
  get 'main/productdetails'
  
  get 'main/checkout'
  
  get 'newsletter_signup', to: 'subscribers#new'
  post 'newsletter_signup', to: 'subscribers#create'

  root 'main#main'
end
