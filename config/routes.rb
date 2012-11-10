Tweeter::Application.routes.draw do
  devise_for :users
  
  resources :tweets
  resources :users
  


  root :to => 'tweets#index'
end
