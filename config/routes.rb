Rails.application.routes.draw do
  #USERS

  # STATIC PAGES
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'

end
