class Admin::OrdersController < ApplicationController
  before_action :if_not_admin
  def index
    @orders = Order.order("id DESC").page(params[:page]).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProducts.where(order_id: order_id = @order.id)
    @total_price =@order_products.sum(:price)
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
 def post_producut_params
 params.require(:order).permit(:order_status)
 end

 def if_not_admin
   redirect_to admin_session_path unless admin_signed_in?
 end
end
