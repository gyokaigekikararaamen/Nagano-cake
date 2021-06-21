class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  
  end

  def index
    @products = Product.order("id DESC").page(params[:page]).reverse_order
   
  end

  def create
    @product=Product.new(post_producut_params)
    if @product.save
     redirect_to  admin_product_path(@product.id)
    else
     render :new
    end 
  end

  def show
<<<<<<< HEAD
     
=======

>>>>>>> origin/develop
     @product = Product.find(params[:id])
  end

  def edit
     @product = Product.find(params[:id])
  end

  def update
     @product = Product.find(params[:id])
     if@product.update(post_producut_params)
     redirect_to  admin_product_path(@product.id)
     else
     render :edit
     end 
  end

  private
  def post_producut_params
     params.require(:product).permit(:genre_id,:name,:image,:description,:price,:product_status)
  end



end
