Rails.application.routes.draw do
  post '/login', to: 'login#login'
  devise_for :users
  devise_scope :user do
    resources :restaurants
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # claim
  resources :claim

end
