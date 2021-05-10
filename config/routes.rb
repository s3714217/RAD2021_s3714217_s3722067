Rails.application.routes.draw do
  get 'login/login' => 'login#login'
  get 'login/sign_up' => 'login#sign_up'
  post 'login/sign_up' => 'login#sign_up'

  resources :items
  resources :users do
    member do
      post :remove_items, to: 'users#remove_items'
    end
  end
  resources :subscribers
  get 'main/main' => 'main#main'
  post 'main/main' => 'main#main'

  get 'main/about'

  get 'main/contact'
  
  get 'main/checkout'
  
  get 'newsletter_signup', to: 'subscribers#new'
  post 'newsletter_signup', to: 'subscribers#create'

  root 'main#main'
end
