Rails.application.routes.draw do
  get 'stati_pages/Home'

  get 'stati_pages/About'

  get 'stati_pages/Contact'

  resources :writers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
