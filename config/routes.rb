Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'genres#index'

  resources :genres, :only => [:index, :show]
end
