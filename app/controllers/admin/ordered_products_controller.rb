class Admin::OrderedProductsController < ApplicationController
  def index
    @orders = Order.all
  end
  def show
    @order = Order.find(params[:id])
    @ordered_prodacts = @order.ordered_prodacts
  end

  def update
    @order.change_status!
    @order_prodacts.change_status!
  end
private

  def order_set
    @order = Order.find(params[:id])
  end
 
  def ordered_prodact_set
    @ordered_prodacts = @order.ordered_prodacts
  end
end
