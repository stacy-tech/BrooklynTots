Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Homepage 
  root 'welcome#home'

  # signup route
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  # login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  # authentication login
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  # logout route
  delete '/logout' => 'sessions#destroy'

  # nested routes 
  resources :comments
  resources :users do 
    resources :posts, only: [:index, :new, :create, :show, :destroy]
  end

  resources :posts do 
    resources :comments
  end
  
end
