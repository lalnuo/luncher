Rails.application.routes.draw do
  resources(:groups) do
    resources :lunches
  end

  resources(:users)
  delete '/logout', :to => 'users#logout'
  post '/login', :to => 'users#login'
  get '/home', :to => 'users#home'

  root :to => 'users#index'
  resources :registrations, :only => [:create, :destroy]
  resources :user_groups


end
