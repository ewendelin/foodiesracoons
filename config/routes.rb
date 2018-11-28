Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  ActiveAdmin.routes(self)
  
  
  post '/login', to: 'login#login'
 
  devise_for :users
  devise_scope :user do
    # resources :restaurants do
    #   resources :posts
    #   resources :claims, only: [:index, :edit, :update] # for seller
    # end

    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        post '/login', to: 'users#login'
        resources :posts, only: [:index, :show] do
          resources :restaurants, only: [:index]
          resources :claims, only: [:create, :show, :destroy]
        end
      end
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
