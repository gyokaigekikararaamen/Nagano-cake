class CartProductsController < ApplicationController
  def create
    product = Product.find(params[:id])
    cart_product = CartProduct.new(cart_product_params)
    cart_product.customer_id = current_customer.id
    cart_product.product_id = product.id
    cart_product.save
    redirect_to cart_products_path
  end

  def index
    @cart_products = CartProduct.where(customer_id: current_customer.id)
  end

  def update
    @cart_product = CartProduct.find(parama[:id])
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
