Rails.application.routes.draw do

  resources :addresses, only:[:new, :create, :show, :edit, :update]
  resources :products do
    resource :favorites, only:[:create, :destroy]
  end
  resources :favorites, only:[:index]
  resources :discs, only:[:new, :create, :edit, :update, :destroy]
  resources :songs, only:[:new, :create, :edit, :update, :destroy]
  resources :carts, only:[:create, :update, :destroy]
  resources :orders, only:[:destroy, :update, :create]
  get "mycart" => 'orders#index', as: 'mycart'
  post "products/:product_id/mycart" => 'carts#create', as: 'cart_create'
  get "/orders/confirmation" => "orders#confirmation", as: 'confirmation'
  post "/orders/confirmation" => "orders#create"
  get "/order_items" => "order_items#index", as: 'index'
  get "/thankyou" => "order_items#thankyou", as: 'thankyou'
  patch "/orders/:id/delivery_status" => "orders#delivery_status"
  get "/delete_confirmation" => "users#delete_confirmation",as: 'delete_confirmation'
  post "/orders/complete/:id" => "orders#complete", as: 'complete'

  root 'products#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only:[:index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
