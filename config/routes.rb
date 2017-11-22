Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/edit' => 'users#edit'
  post '/update' => 'users#updates'
  get '/profile' => 'users#show'

  resources :users

   get "/auth/:provider/callback" => "sessions#create_from_omniauth"

end
