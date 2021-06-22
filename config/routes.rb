Rails.application.routes.draw do

 devise_for :admins
 devise_for :customers, controllers: {registrations: 'customers/registrations',sessions: 'customers/sessions' }
  root 'homes#top'
  get 'home/about' => 'homes#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'customer' => 'customers#show'
  get 'customer/edit' => 'customers#edit'
  patch 'customer' => 'customers#update'
  get 'customer/unsubscribe' => 'customers#unsubscribe'
  patch 'customer/hide' => 'customers#hide'

 resources :addresses, only: [ :create, :index, :edit, :update,:destroy]

 get 'orders/confirm' => 'orders#confirm'
 get 'orders/complete' => 'orders#complete'
 resources :orders, only: [:new, :create, :index, :show,]
 post 'orders/new' => 'orders#save'

 resources :products, only: [:index, :show]

 resources :cart_products, only: [:index,:destroy,:update]
 delete 'cart_products'  => 'cart_products#destroy_all', as:'destroy_cart_products'
 post 'cart_product/:id' => 'cart_products#create', as:'create_cart_products'

namespace :admin do
    resources :customers, only: [:show, :index,:edit,:update]

    resources :products, except: [:destroy]

    resources :orders, only: [:update,:index, :show,]

    patch 'ordered_products/:id' => 'admin/ordered_products#update'

    resources :genres, only: [:new, :create, :edit, :update]
  end


end
