class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def save
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.freght = "800"
    if request.post? then
       if params[:payment_method] == "0" then
       else
          @order.payment_method = "1"
       end
    end
    if request.post? then
       if params[:address] == "0" then
          @order.postal_code = current_customer.postal_code
          @order.address = current_customer.address
          @order.name = ("current_customer.first_name" + "current_customer.last_name")
       elsif params[:address] == "1" then
          @order.postal_code =1
          @order.address =1
          @order.name =1
       else
          @order.postal_code =1
          @order.address =1
          @order.name =1
       end
    end
    @order.save
    redirect_to orders_confirm_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @orders = Order.find(params[:id])
    @order = Ordered_product.find(params[:id])
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
