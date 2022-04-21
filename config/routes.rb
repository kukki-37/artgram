Rails.application.routes.draw do

 devise_for :users
  root to: "homes#top"
  resources :users, except: [:new, :create, :destroy] do
   member do
      get :favorites
   end
  end
  
  resources :arts do
    resources :favorites, only: [:create, :destroy] 
  end
end
