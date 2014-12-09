Rails.application.routes.draw do
  resources(:groups) do
    resources :lunches, :shallow => true
  end

  resources :registrations, :only => [:create]
end
