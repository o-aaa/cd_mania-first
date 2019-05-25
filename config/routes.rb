Rails.application.routes.draw do

  resources :addresses, only:[:new, :create, :show, :edit, :update]
  resources :favorites, only:[:index, :create, :destroy]
  resources :products
  resources :discs, only:[:new, :create, :edit, :update, :destroy]
  resources :songs, only:[:new, :create, :edit, :update, :destroy]
  resources :carts, only:[:create, :update, :destroy]
  resources :orders, only:[:destroy, :update]
  get "mycart" => 'orders#index', as: 'mycart'
  post "products/:product_id/mycart" => 'carts#create', as: 'cart_create'
  get "/users/:id/orders/confirmation/:id" => "orders#confirmation", as: 'confirmation'
  get "/order_items" => "order_items#index", as: 'index'
  get "/thankyou" => "order_items#thankyou", as: 'thankyou'
  get "/delete_confirmation" => "users#delete_confirmation",as: 'delete_confirmation'
  root 'products#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only:[:index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
