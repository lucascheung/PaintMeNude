Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  resources :nudies, only: [:new, :create, :index, :destroy, :show]
  resources :users, only: [:new, :create, :index, :destroy, :show]
  get 'design', to: 'pages#design'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
