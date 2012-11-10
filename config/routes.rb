Tweeter::Application.routes.draw do
  resources :tweets

  devise_for :users

 root :to => 'welcome#index'
end
