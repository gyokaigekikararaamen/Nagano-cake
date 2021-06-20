class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genre = Genre.all
  end

  def index
    @products = Product.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def create
    
     @product=Product.new(post_producut_params)
     @product.save
     redirect_to  admin_product_path(@product.id)
  end

  def show
   
     @product = Product.find(params[:id])
  end

  def edit
     @product = Product.find(params[:id])
      @genre = Genre.all
  end

  def update
     @product = Product.find(params[:id])
     @product.update(post_producut_params)
     redirect_to  admin_product_path(@product.id)
  end

  private
  def post_producut_params
     params.require(:product).permit(:genre_id,:name,:image,:description,:price,:product_status)
  end
 def set_genres
  @genres = Genre.all
 end


end
