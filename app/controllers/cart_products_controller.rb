class CartProductsController < ApplicationController

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @product = Product.find(params[:id])
    @cart_product.product_id = @product.id
    @cart_product.customer_id = current_customer.id
    @cart_product.save
    redirect_to cart_products_path
  end

  def index
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @total_price = 0
    @cart_products.each do |cart_product|
      @total_price += cart_product.product.price * cart_product.amount * 1.10
    end
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
    CartProduct.where(customer_id: current_customer.id).destroy_all
    redirect_to cart_products_path
  end

  private
  def cart_product_params
    params.permit(:amount)
  end

end
