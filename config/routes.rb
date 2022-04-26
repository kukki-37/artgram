Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "homes#top"
  get '/about' => 'homes#about'
  resources :users, except: [:new, :create, :destroy] do
   member do
     get :favorites
   end
  end
  get 'search' => 'arts#search'
  post 'arts/:id' => 'arts#show'
  resources :arts do
    resource :favorites, only: [:create, :destroy] 
    resource :comments, only:[:create, :destroy]
  end
end
