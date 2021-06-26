Rails.application.routes.draw do

  devise_for :admins,controllers:{
   sessions: 'admins/sessions'
  }

  devise_for :customers, controllers:{
   sessions: 'customers/sessions'
  }
  root 'homes#top'
  get 'home/about' => 'homes#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'customer' => 'customers#show'
  get 'customer/edit' => 'customers#edit'
  patch 'customer' => 'customers#update'
  get 'customer/unsubscribe' => 'customers#unsubscribe'
  patch 'customer/hide' => 'customers#hide'

 resources :addresses, only: [ :create, :index, :edit, :update,:destroy]

 get 'orders/confirm/:id' => 'orders#confirm', as: 'orders_confirm'
 get 'orders/thanks/' => 'orders#thanks', as: 'orders_thanks'
 post 'orders/complete/:id' => 'orders#complete', as: 'orders_complete'


 resources :orders, only: [:new, :create, :index, :show]
 resources :products, only: [:index, :show]
 resources :cart_products, only: [:create, :index,:destroy,:update]
 delete 'cart_products'  => 'cart_products#destroy_all'

 resources :products, only: [:index, :show]

 resources :cart_products, only: [:index,:destroy,:update]
 delete 'cart_products'  => 'cart_products#destroy_all', as:'destroy_cart_products'
 post 'cart_product/:id' => 'cart_products#create', as:'create_cart_products'
 get 'search' => 'products#search', as:'search_products'


namespace :admin do
    resources :customers, only: [:show, :index,:edit,:update]

    resources :products, except: [:destroy]

    resources :orders, only: [:update,:index, :show]

    patch 'ordered_products/:id' => 'ordered_products#update'


    resources :genres, only: [:new, :create, :edit, :update]
  end
  # resources 内に入れると admin/admin/customer#hide を参照してしまうため外へ記述しました。
    put 'admin/customers/hide/:id' => 'admin/customers#hide', as: 'admin_customer_hide'

    post '/admin/ordered_products/:id' => 'admin/orders#show', as: 'admin_orderd_products'


end
