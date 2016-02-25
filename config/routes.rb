Rails.application.routes.draw do
  #USERS

  # STATIC PAGES

  root to: 'static_pages#home'
  get '/help', to: 'static_pages#help'

end
