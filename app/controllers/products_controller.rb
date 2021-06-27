class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
    @products_all = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.search(params[:keyword]).page(params[:page])
    @keyword = params[:keyword]
    render "search"
  end

end
