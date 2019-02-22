Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :nudies, only: [:new, :create, :index, :destroy, :show] do
    resources :appointments, only: [:new, :create, :index, :destroy, :show]
  end
  resources :users, only: [:new, :create, :index, :destroy, :show]
  get 'design', to: 'pages#design'
  get 'male_nudies', to: 'nudies#male_filter', as: :male_nudies
  get 'female_nudies', to: 'nudies#female_filter', as: :female_nudies
end
