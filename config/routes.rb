Rails.application.routes.draw do

  get 'sessions/new'

  # STATIC PAGES

  root to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'

  #USERS

  get '/signup', to: 'users#new'
  resources :users

  #sessions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'




end
