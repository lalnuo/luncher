Rails.application.routes.draw do
  resources(:groups) do
    resources :lunches
  end

  resources(:users)
  delete '/logout', :to => 'users#logout'
  post '/login', :to => 'users#login'
  get '/home', :to => 'users#home'

  post '/groups/search_by_city', :to => 'groups#search_by_city'
  post '/groups/search_secret_group', :to => 'groups#search_secret_group'
  root :to => 'users#index'
  resources :registrations, :only => [:create, :destroy]
  resources :user_groups


end
