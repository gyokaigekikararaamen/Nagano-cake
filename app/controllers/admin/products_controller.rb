class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new(product_params)
  end

  def index
    @products = Product.all
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to admin_product_path(product.id)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(prams[:id])
    product.update
    redirect_to admin_product_path(product.id)
  end

  private
  def product_params
    params.require(:product).permit(:image_id, :name, :description, :genre, :price, :product_status)
  end
end
