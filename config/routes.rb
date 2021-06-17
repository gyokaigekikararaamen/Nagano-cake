Rails.application.routes.draw do
 
 devise_for :admins
 devise_for :customer
  root 'homes#top'
  get 'home/about' => 'homes#about'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :custmers, except: [:destroy]
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/hide' => 'customers#hide'

 resources :addresses, only: [ :create, :index, :edit, :update,:destroy]
 
 resources :orders, only: [:new, :create, :index, :show,]
 post 'orders/confirm' => 'orders#confirm'
 get 'orders/complete' => 'orders#complete'
 
 resources :products, only: [:index, :show]
 
 resources :cart_products, only: [:create, :index,:destroy,:update]
 delete 'cart_products'  => 'cart_products#destroy_all'

namespace :admin do
    resources :customers, only: [:show, :index,:edit,:update]
    
    resources :products, except: [:destroy]
    
    resources :orders, only: [:update,:index, :show,]
    
    patch 'ordered_products/:id' => 'admin/ordered_products#update'
    
    resources :genres, only: [:new, :create, :edit, :update]
  end


end
