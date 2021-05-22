Rails.application.routes.draw do
  get 'login/forgot_pwd'
  get 'login/update_details'
  get 'login/logout'
  get 'login/login' => 'login#login'
  get 'login/sign_up' => 'login#sign_up'
  get 'login/update_details' => 'login#update_details'
  post 'login/sign_up' => 'login#sign_up'
  post 'login/login' => 'login#login'
  post 'login/update_details' => 'login#update_details'
  get 'login/forgot_pwd', to: 'login#forgot_pwd'
  post 'login/forgot_pwd', to: 'login#forgot_pwd'

  get '/admin', to: 'admin#admin'
  get 'admin/admin'

  get 'main/main' => 'main#main'
  post 'main/main' => 'main#main'
  get 'main/helpsupport'
  get 'main/productdetails'
  get 'main/checkout'
  get 'main/profile'
  get 'main/all_collection'
  get 'main/rating'
  get 'main/collection'
  get 'main/savedlist'
  post 'main/all_collection' => 'main#all_collection'
  
  get 'newsletter_signup', to: 'subscribers#new'
  post 'newsletter_signup', to: 'subscribers#create'
  
  post 'to_productdetails', to: 'main#to_productdetails'
  post 'to_saved', to: 'main#to_saved'
  post 'removed_saved', to: 'main#removed_saved'
  post 'toggle_saved', to: 'main#toggle_saved'
  post 'add_to', to: 'carts#add_to'
  post 'add_to_with_param', to: 'carts#add_to_with_param'
  post 'remove_item', to: 'carts#remove_item'
  post 'remove_items', to: 'carts#remove_items'
  post 'toggle_subscriber', to: 'subscribers#toggle_subscriber'
  post 'add_rating', to: 'users#add_rating'
  
  get '/auth/twitter/callback', to: 'omniauth_callbacks#twitter'
  
  resources :items
  resources :users
  resources :subscribers
  resources :carts
  
  root 'main#main'
end
