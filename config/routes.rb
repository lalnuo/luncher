Rails.application.routes.draw do
  resources(:groups) do
    resources :lunches
  end

  delete '/logout', :to => 'groups#logout'

  root :to => 'groups#index'
  resources :registrations, :only => [:create]
end
