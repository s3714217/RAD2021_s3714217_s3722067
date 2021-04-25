Rails.application.routes.draw do
  resources :items
  get 'main/main'

  get 'main/about'

  get 'main/contact'

  root 'main#main'
end
