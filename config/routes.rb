Rails.application.routes.draw do
  get 'main/rating'

  get 'main/testcollection'

  get 'main/savedlist'

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
      post :remove_item, to: 'carts#remove_item'
    end
  end
  
  post :filter_saved, to: 'main#filter_saved'
  
  post :add_rating, to: 'users#add_rating'
  
  post :to_saved, to: 'main#to_saved'
  
  post :removed_saved, to: 'main#removed_saved'
  
  post :to_productdetails, to: 'main#to_productdetails'
  
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
