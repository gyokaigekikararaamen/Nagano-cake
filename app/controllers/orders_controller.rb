class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = Order.find(current_user.id)
    @order = Ordered_product.find_by("order_id", @orders.order_id)
  end

  def show
    @orders = Order.find(params[:id])
    @order = Ordered_product.find(params[:id])
  end

end
