Rails.application.routes.draw do
  resources :items
  resources :users do
    member do
      post :remove_items, to: 'users#remove_items'
    end
  end
  resources :subscribers
  get 'main/main'

  get 'main/about'

  get 'main/contact'
  
  get 'main/productdetails'
  
  get 'main/checkout'
  
  get 'newsletter_signup', to: 'subscribers#new'
  post 'newsletter_signup', to: 'subscribers#create'

  root 'main#main'
end
