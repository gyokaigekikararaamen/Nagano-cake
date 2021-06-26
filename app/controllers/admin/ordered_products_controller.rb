class Admin::OrderedProductsController < ApplicationController
  before_action :if_not_admin

  def update
     @order_product = OrderedProduct.find(params[:id])
     @order =Order.find(@order_product.order_id)
    @ordered_products = OrderedProduct.where(order_id: @order.id)
    
     if@ordered_products.update( ordered_product_params) && @ordered_products.each do |ordered_product| ordered_product.production_status == "製作中" end
        @order.order_status = "製作中"
        @order.update(order_params)
         redirect_to admin_order_path(@order.id)
     elsif @ordered_products.update( ordered_product_params) && @ordered_products.each do |ordered_product| ordered_product.production_status == "制作完了" end
        @order.order_status = "発送準備中"
        @order.update(order_params)
         redirect_to admin_order_path(@order.id)
    
      else @order_products.update( ordered_product_params)
      edirect_to admin_order_path(@order.id)
      end
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
