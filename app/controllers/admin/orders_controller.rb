class Admin::OrdersController < ApplicationController
  def index
    @orders = order.all
  end

  def show
    @order = order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update
    redirect_to admin_orders_path(order.id)
  end

end
