class Admin::OrderedProductsController < ApplicationController
  def update
    order_product = Orderproduct.find(params[:id])
    order_product.update
    redirect_to admin_orderd_products(order_product.id)
    #本来javaを使うのでredirectは無し
  end

end
