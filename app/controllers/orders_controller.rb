class OrdersController < ApplicationController
   before_action :authenticate_customer!

  def index
    @orders = current_customer.orders.where.not(order_status:0) #注文ステータスが0(未注文)以外の注文を取得
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.payment_method = params[:payment_method].to_i

    if params[:address_order] == "0"
      order.postal_code = current_customer.postal_code
      order.address = current_customer.address
      order.name = current_customer.last_name + current_customer.first_name
    elsif params[:address_order] == "1"
      address = Address.find(params[:chosed_address])
      order.postal_code = address.postal_code
      order.address = address.address
      order.name = address.name
    elsif params[:address_order] == "2"

    end

    order.save
    if order.postal_code.presence && order.address.presence && order.name.presence
			 redirect_to orders_confirm_path(order.id)
		else
			 redirect_to orders_new_path
		end

	end

  def confirm
    @order = Order.find(params[:id])
    without_freight = 0
		current_customer.cart_products.each do |cart_product| #商品の料金計算
			 without_freight += (cart_product.product.price * 1.1) * cart_product.amount
		end
		@order.freight = 800
    @order.billing_amount =   without_freight.floor + @order.freight
		@order.save
  end

  def complete
    @order = Order.find(params[:id])
    @order.order_status =  1
    @order.save
    current_customer.cart_products.each do |cart_product| #注文商品に登録
			ordered_product = OrderedProduct.new
			ordered_product.order_id = @order.id
			ordered_product.product_id = cart_product.product.id
			ordered_product.amount = cart_product.amount
			ordered_product.price = cart_product.product.price * 1.1
			ordered_product.save
		end
    current_customer.cart_products.destroy_all
    orders_thanks_path
  end

  def thanks
  end

  private

  def order_params
    params.permit(:postal_code, :address, :name,)
  end

end
