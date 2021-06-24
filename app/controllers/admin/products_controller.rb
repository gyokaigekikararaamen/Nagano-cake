class Admin::ProductsController < ApplicationController
   before_action :if_not_admin

  def new
    @product = Product.new

  end

  def index
    @products = Product.order("id DESC").page(params[:page]).reverse_order

  end

  def create
    @product=Product.new(post_product_params)
    if @product.save
     redirect_to  admin_product_path(@product.id)
    else
     redirect_to  new_admin_product_path
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
     if@product.update(post_product_params)
     redirect_to  admin_product_path(@product.id)
     else
     redirect_to  edit_admin_product_path(@product.id)
     end
  end

  private
  def post_product_params
     params.require(:product).permit(:genre_id,:name,:image,:description,:price,:product_status)
  end
  
  def if_not_admin
   redirect_to admin_session_path unless admin_signed_in?
  end

end
