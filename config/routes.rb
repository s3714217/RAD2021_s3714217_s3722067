Rails.application.routes.draw do
  resources :items
  resources :users
  resources :subscribers
  get 'main/main'

  get 'main/about'

  get 'main/contact'

  root 'main#main'
end
