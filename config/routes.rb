Rails.application.routes.draw do
  #USERS

  # STATIC PAGES
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'

end
