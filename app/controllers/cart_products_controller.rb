class CartProductsController < ApplicationController

  def create
<<<<<<< HEAD
    
=======
    @cart_product = CartProduct.new(cart_product_params)
    @product = Product.find(params[:id])
    @cart_product.product_id = @product.id
    @cart_product.customer_id = current_customer.id
    @cart_product.save
    redirect_to cart_products_path
>>>>>>> origin/develop
  end

  def index
    @cart_products = CartProduct.where(customer_id: current_customer.id)
<<<<<<< HEAD
=======
    @total_price = 0
    @cart_products.each do |cart_product|
      @total_price += cart_product.product.price * cart_product.amount * 1.10
    end
>>>>>>> origin/develop
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
<<<<<<< HEAD
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @cart_products.destroy
=======
    CartProduct.where(customer_id: current_customer.id).destroy_all
>>>>>>> origin/develop
    redirect_to cart_products_path
  end

  private
  def cart_product_params
<<<<<<< HEAD
     params.require(:cart_product).permit(:amount)
=======
    params.permit(:amount)
>>>>>>> origin/develop
  end

end

