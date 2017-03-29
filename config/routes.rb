Rails.application.routes.draw do
  root 'home#index'
  get '/users' => 'users#show'
  post '/products' => 'products#create'
  post '/buy' => 'products#update'
  post '/product/' => 'products#del'
  resources :products, only: [:index, :show,:update, :delete]
  devise_for :users, controllers: {registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
