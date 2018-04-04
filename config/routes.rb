Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root to: 'static_pages#home'

  get '/about', to: 'static_pages#about'

  get '/contact', to: 'static_pages#contact'

  resources :writers
  resources :sessions, only: [:create, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
