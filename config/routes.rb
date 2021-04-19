Rails.application.routes.draw do
  get 'main_page/main_page'

  root 'main_page#main_page'
end
