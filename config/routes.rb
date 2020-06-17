Rails.application.routes.draw do
  devise_for :admins
  get 'destinations/index'
  get 'destinations/create'
  get 'destinations/destroy'
  get 'destinations/edit'
  get 'destinations/update'
  get 'customers/show'
  get 'customers/delete_account'
  get 'customers/Invalid'
  get 'customers/edit'
  get 'customers/update'
  get 'orders/new'
  get 'orders/confirm'
  get 'orders/create'
  get 'orders/thanks'
  get 'cart_products/create'
  get 'cart_products/index'
  get 'cart_products/update'
  get 'cart_products/destroy'
  get 'cart_products/empty'
  get 'products/index'
  get 'products/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    get 'homes/top'
    resources :products, only: [:index,:new,:create,:show,:edit,:update]
    resources :genres, only: [:index,:create,:edit,:update]
    resources :genres, only: [:index,:show,:edit,:update]
    resources :orders, only: [:index,:show,:update]
    resources :order_products, only: [:update]
  end
end
