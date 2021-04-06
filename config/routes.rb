Rails.application.routes.draw do
  get 'main_page/main_page'

  get 'login/login'

  root 'main_page#main_page'
end
