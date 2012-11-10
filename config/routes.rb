Tweeter::Application.routes.draw do
  resources :tweets
  resources :users
  
  devise_for :users

  root :to => 'tweets#index'
end
