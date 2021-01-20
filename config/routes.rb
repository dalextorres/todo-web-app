Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/edit/:id', to: 'users#edit'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :sessions, only: [:create, :new, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
