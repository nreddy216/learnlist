Rails.application.routes.draw do

  # STATIC PAGES

  root to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'

  #USERS

  get '/signup', to: 'users#new'


  resources :users

end
