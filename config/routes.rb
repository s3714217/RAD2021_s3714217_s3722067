Rails.application.routes.draw do
  resources :items
  resources :users
  resources :subscribers
  get 'main/main'

  get 'main/about'

  get 'main/contact'
  
  get 'newsletter_signup', to: 'subscribers#new'
  post 'newsletter_signup', to: 'subscribers#create'

  root 'main#main'
end
