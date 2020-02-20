Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "static_pages#index" 
  devise_for :users
  resources :users, only: [:show]
  resources :events
  resources :events do
    resources :participations, only: [:new, :create, :index]
  end
  resources :participations, only: [:new, :create, :index]

  


end
