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
    
  end

  def update
    
  end

  def destroy
  end

  def destroy_all
    
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:anount)
  end

end
