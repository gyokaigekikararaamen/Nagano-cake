class OrdersController < ApplicationController

  def index
    @orders = current_customer.orders
  end

  def show
    @orders = Order.find(params[:id])
    @order = Ordered_product.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    billing_amount = 0
		current_customer.cart_products.each do |cart_product|
			 billing_amount += (cart_product.product.price * 1.1) * cart_product.amount
		end

    @order.freight = 800
    @order.billing_amount =   billing_amount.floor
    @order.customer_id = current_customer.id
    @order.payment_method = params[:payment_method].to_i

    if params[:address_order].to_i == 0
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:address_order].to_i == 1
      address = Address.find(params[:chosed_address])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    elsif params[:address_order].to_i == 2

    end

    @order.save

    if @order.postal_code.presence && @order.address.presence && @order.name.presence
			 redirect_to orders_confirm_path(@order.id)
		else
			 redirect_to orders_new_path
		end

  end

  def confirm
    @order = Order.find(params[:id])
  end

  def conplete
    @order = Order.find(params[:id])
    current_customer.cart_products.each do |cart_product|
			ordered_product = OrderedProduct.new
			ordered_product.order_id = @order.id
			ordered_product.item_id = cart_product.product.id
			ordered_product.amount = cart_product.amount
			ordered_product.price = cart_product.product.price * 1.1
			ordered_product.save
		end
    current_customer.cart_products.destroy_all
  end


  private

  def order_params
    params.permit(:postal_code, :address, :name)
  end

end
