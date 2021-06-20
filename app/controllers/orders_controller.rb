class OrdersController < ApplicationController

  def index
    @orders = Order.find(current_user.id)
    @order = Ordered_product.find_by("order_id", @orders.order_id)
  end

  def show
    @orders = Order.find(params[:id])
    @order = Ordered_product.find(params[:id])
  end
  
  def new
    @order = Order.new
  end
  
  def create
  end
  
  def confirm
  end
  
  def conplete
  end

  private
  
  def order_params
    require(:order).permit(:payment_method, :postal_code, :adress, :name)
  end
end
