class HomesController < ApplicationController
  
  def top
    @products = Product.page(params[:page]).per(4).reverse_order
  end
  
  def about
  end
  
end
