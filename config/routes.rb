Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/confirmation'
  get 'order_items/index'
  get 'favorites/index'
  get 'addresses/new'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'products/index'
  get 'products/show'
  get 'products/new'
  get 'products/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
