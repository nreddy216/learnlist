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
  get '/sessions', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'


  #lists
  # resources :lists, only: [:create, :destroy]
  post '/lists', to: 'lists#create'
  delete '/lists', to: 'lists#destroy'

  #items
  # resources :items, only: [:create, :destroy]
  post '/items', to: 'items#create'
  delete '/items', to: 'items#destroy'


  get "/fetch_items", to: 'items#from_lists', as: 'fetch_items' 

end
