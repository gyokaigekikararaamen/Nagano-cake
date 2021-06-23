class Admin::OrderedProductsController < ApplicationController
  def index
   
  end
  def show
  
  end
  def update
    @order_products = OrderProducts.find(params[:id])
     if@product.update(post_order_producut_params)
     redirect_to admin_order_path(@order.id)
     else
     render :show
     end
  end 
 private
end
