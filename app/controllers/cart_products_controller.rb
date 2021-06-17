class CartProductsController < ApplicationController
  def create
    cart_product = Cartproduct.new(cart_product_params)
    cart_product.save
    redirect_to new_order_path(cart_product.id)
  end

  def index
    cart_product = current_customer.cart_product
    @cart_product = cart_product.all
  end

  def update
    cart_product = Cart_product.find(params[:id])
    cart_product.update(cart_product_params)
    redirect_to cart_product_path(cart_product.id)
   #本来javaを使うのでredirectは無し
  end

  def destroy
    cart_product = Cartproduct.find(params[:id])
    cart_product.destroy
    redirect_to cart_products_path
    #本来javaを使うのでredirectは無し
  end

  def destroy_all
    @cart_product = current_customer.cart_product.all
    @cart_product.destroy
  end

  private
  def cart_product_params
    params.require(:cartproduct).permit(:customer_id, :product_id, :amount)
  end

end
