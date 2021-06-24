class Admin::OrderedProductsController < ApplicationController
  before_action :if_not_admin
  def index

  end
  def show

  end
  def update
    @order_products = OrderProducts.find(params[:id])
     if@product.update(post_order_producut_params)
     redirect_to admin_order_path(@order.id)
     else
     render :show
     end
  end
 private
 def if_not_admin
   redirect_to admin_session_path unless admin_signed_in?
 end

 end
