class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new

  end

  def index
    @products = Product.order("id DESC").page(params[:page]).reverse_order

  end

  def create
    @product=Product.new(post_product_params)
    @product.product_status = params[:product_status].to_i
    if @product.save
     redirect_to  admin_product_path(@product.id)
    else
     render :new
    end
  end

  def show

     @product = Product.find(params[:id])
  end

  def edit
     @product = Product.find(params[:id])
  end

  def update
     @product = Product.find(params[:id])
     @product.product_status =  params[:product_status].to_i
     if@product.update(post_product_params)
     redirect_to  admin_product_path(@product.id)
     else
     render :edit
     end
  end

  private
  def post_product_params
     params.require(:product).permit(:genre_id,:name,:image,:description,:price)
  end



end
