Tweeter::Application.routes.draw do
  devise_for :users
  
  resources :tweets
  resources :users do
    member do
      post :follow
      delete :follow, :to => 'users#unfollow'
    end
  end
  


  root :to => 'tweets#index'
end
