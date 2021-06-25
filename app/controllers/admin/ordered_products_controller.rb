class Admin::OrderedProductsController < ApplicationController
  before_action :if_not_admin
  def index

  end
  def show

  end
  def update
     @order=Order.find(params[:id])
    @order_products = OrderedProduct.find(params[:id])
     if@order_products.update( ordered_product_params) && @order_products.production_status == "製作中"
        @order.order_status = "製作中"
        @order.update(order_params)
         redirect_to admin_order_path(@order.id)
     elsif@order_products.update( ordered_product_params) && @order_products.production_status == "制作完了"
        @order.order_status = "発送準備中"
        @order.update(order_params)
         redirect_to admin_order_path(@order.id)
     else
       redirect_to admin_order_path(@order.id)
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
