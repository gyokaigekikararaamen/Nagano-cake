class CartProductsController < ApplicationController

  def create
    
  end

  def index
    @cart_products = CartProduct.where(customer_id: current_customer.id)
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(cart_product_params)
    redirect_to cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  def destroy_all
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @cart_products.destroy
    redirect_to cart_products_path
  end

  private
  def cart_product_params
     params.require(:cart_product).permit(:amount)
  end

end

