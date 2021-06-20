class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = Order.find(current_customer.id)
    @order = Ordered_product.find_by("order_id", @orders.order_id)
  end

  def show
    @orders = Order.find(params[:id])
    @order = Ordered_product.find(params[:id])
  end
  
  def save
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_confirm_path(params[:id])
  end

  def confirm
    
  end

  def create
    @order = Order.find(params[:id])
    @order.save
    redirect_to orders_complete_path
  end
  def complete
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

end
