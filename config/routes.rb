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
  get '/auth/:provider/callback' => 'sessions#omniauth'
  
  # logout route
  delete '/logout' => 'sessions#destroy'

end
