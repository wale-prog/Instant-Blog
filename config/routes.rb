Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users, only: [:show, :index] do 
    resources :posts, only: [:index, :show]
  end
  root to: 'users#index'
end
