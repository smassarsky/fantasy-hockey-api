Rails.application.routes.draw do

  post '/login', to: 'sessions#login'
  post '/signup', to: 'sessions#signup'
  delete '/logout', to: 'sessions#logout'
  get '/dashboard', to: 'sessions#dashboard'

end
