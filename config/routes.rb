Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'genres#index'
  resources :users, :only => [:create]
  resources :sessions, :only => [:create]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :genres, :only => [:index, :show] do
    resources :selections, :only => [:create]
    get 'selections/delete', to: 'selections#destroy', as: 'sel_destroy'
  end
end
