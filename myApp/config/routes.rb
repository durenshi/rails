Rails.application.routes.draw do
  apipie
  resources :groups
  get 'sessions/new'

  resources :projects
  get '/get_all_projects', to: 'projects#get_all_projects'

  resources :users
  post '/user_is_exist', to: 'users#is_exist'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

