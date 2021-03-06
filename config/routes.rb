Rails.application.routes.draw do



  get '/' => "sessions#welcome", as:"root"

#users route


 get '/signup' => 'users#new'
 post '/signup' => 'users#create'

 #login route
 get '/login' => 'sessions#new'
 post '/login' => 'sessions#create'

 #logout route
 delete '/logout' => 'sessions#destroy'

#callback route
get '/auth/google_oauth2/callback', to: 'sessions#google'

  resources :reviews
  resources :users
  resources :plants do 
    resources :reviews, shallow: true
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
