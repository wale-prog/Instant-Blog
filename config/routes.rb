Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users, only: [:show, :index] do 
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :new, :destroy]
      resources :likes, only: [:create]
    end
  end
  root to: 'users#index'

  namespace :api do 
    namespace :v1 do
      resources :users, only:  %i[index show] do
        resources :posts, only:  %i[index show] do
          resources :comments, only:  %i[index new create] do
          end
        end
      end
    end
  end
end
