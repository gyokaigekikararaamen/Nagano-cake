class Admin::OrderedProductsController < ApplicationController
  before_action :if_not_admin
  def index

  end
  def show

  end
  def update
     @order=Order.find(params[:id])
    @order_products = OrderedProduct.find(params[:id])
     if@order_products.update( ordered_product_params)
     redirect_to admin_order_path(@order.id)
     else
     render :show
     end
  end
 private
 def if_not_admin
   redirect_to admin_session_path unless admin_signed_in?
 end
 
  def ordered_product_params
   params.require(:ordered_product).permit(:production_status)
  end


end
