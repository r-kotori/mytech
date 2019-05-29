Rails.application.routes.draw do
  root 'static_pages#home'
  get '/service', to: 'static_pages#service'
  get '/policy', to: 'static_pages#policy'
  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'
  get '/my', to: 'static_pages#my'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
