Rails.application.routes.draw do
  devise_for :users
  get 'profile'=>'users#profile'
  get 'settings'=>'users#edit'
  resources :users do
    member do
      get :confirm_email
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  Rails.application.routes.default_url_options[:host] = 'https://tutweetv2.herokuapp.com/'
  root'home#index'
  get '/tweets', to: 'tweets#index'
  
  resources :tweets 
  namespace :api do
    namespace :v1 do
      resources :tweets, only: [:index, :create, :show, :destroy]
      resources :users, only: [:create, :index]
    end
  end
end