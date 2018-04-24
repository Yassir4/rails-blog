Rails.application.routes.draw do

  get 'relationships/follow_user'

  get 'relationships/unfollow_user'

  root to: 'static_pages#home'

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get '/login', to: 'sessions#new'
  post '/login',to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  get '/signup',  to: 'writers#new'
  post '/signup', to: 'writers#create'

  post ':id/follow_writer', to: 'relationships#follow_writer', as: :follow_writer
  post ':id/unfollow_writer', to: 'relationships#unfollow_writer', as: :unfollow_writer

  resources :writers
  resource :sessions, only: [:new]
  resources :articles   

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end