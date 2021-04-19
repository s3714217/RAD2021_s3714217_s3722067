Rails.application.routes.draw do
  get 'main/main'

  get 'main/about'

  get 'main/contact'

  root 'main#main'
end
