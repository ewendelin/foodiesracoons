Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    resources :restaurants
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
