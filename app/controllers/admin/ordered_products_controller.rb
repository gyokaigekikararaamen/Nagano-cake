class Admin::OrderedProductsController < ApplicationController
  before_action :if_not_admin
  def index

  end

  def show

  end

  def update
   order_product = OrderedProduct.find(params[:id])
   order_product.update(ordered_product_params)
   order = Order.find(order_product.order_id)
   ordered_products = OrderedProduct.where(order_id: order.id)
   if ordered_products.all? do |ordered_products| ordered_products.production_status == "制作完了"
   end
    order.order_status = "発送準備中"
    order.save
   elsif ordered_products.any? do |ordered_products| ordered_products.production_status == "製作中"
   end
    order.order_status = "製作中"
    order.save
   end
   redirect_to admin_order_path(order_product.order_id)
  end


 private

 def if_not_admin
   redirect_to admin_session_path unless admin_signed_in?
 end

 def ordered_product_params
  params.require(:ordered_product).permit(:production_status)
 end
 
 def order_params
  params.permit(:order_status)
 end
end
