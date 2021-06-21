class Admin::OrdersController < ApplicationController
  def index
  　 @orders = Order.order("id DESC").page(params[:page]).reverse_order
  end

  def show
  　 @order = Order.find(params[:id])
  end

  def update
  　  @order = Order.find(params[:id])
     if@product.update(post_producut_params)
     redirect_to admin_order_path(@order.id)
     else
     render :show
     end
  end
 
  private

 
end
