Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
 devise_for :users
  root to: "homes#top"
  resources :users, except: [:new, :create, :destroy] do
   member do
     get :favorites
   end
  end
  get 'search' => 'arts#search'
  
  resources :arts do
    resource :favorites, only: [:create, :destroy] 
  end
end
