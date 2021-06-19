class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genre = Genre.all
  end

  def index
    @prodacts = Product.page(params[:page]).reverse_order
    @genre = Genre.all
  end

  def create
     genre.id = product.genre_id
     @product = Product.new(producut_params)
     @product.save
     redirect_to  admin_product_path(@product.id)
  end

  def show
     @product = Product.find([:id])
  end

  def edit
     @product = Product.find([:id])
     
  end

  def update
     @product = Product.find([:id])
     @product.update
     redirect_to  admin_product_path(@product.id)
  end

  private
  def producut_params
     params.require(:producut).permit(:genre_id,:name,:image_id,:description,:price,:product_status)
  end
end
