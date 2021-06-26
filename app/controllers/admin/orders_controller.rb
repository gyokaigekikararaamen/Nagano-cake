class Admin::OrdersController < ApplicationController
 before_action :if_not_admin
  def index
    @orders = Order.all.where.not(order_status:0)

  end

  def show
    @order = Order.find(params[:id])
    @order.freight = 800
    #@order=Order.all
<<<<<<< HEAD
     @ordered_product=@order.ordered_products
     @ordered_products=OrderedProduct.where(order_id: @order)
=======
    @ordered_product=@order.ordered_products
>>>>>>> origin/develop

  end

  def update
<<<<<<< HEAD
   @order = Order.find(params[:id])
=======
    @order = Order.find(params[:id])
>>>>>>> origin/develop
      @ordered_product=@order.ordered_products
     if @order.update(order_params) && @order.order_status=="入金確認"
         @ordered_product.each do |ordered_product|
         ordered_product.production_status = "制作待ち"
         ordered_product.save
        end
<<<<<<< HEAD
         redirect_to admin_order_path(@order.id)
     elsif @order.update(order_params) && @order.order_status=="入金待ち"
          @ordered_product.each do |ordered_product|
          ordered_product.production_status = "制作不可"
          ordered_product.save
         end
          redirect_to admin_order_path(@order.id)
     elsif @order.update(order_params) && @order.order_status=="制作中"
          @ordered_product.each do |ordered_product|
          ordered_product.production_status = "制作中"
          ordered_product.save
         end
          redirect_to admin_order_path(@order.id)
     elsif @order.update(order_params) && @order.order_status=="発送準備中"
          @ordered_product.each do |ordered_product|
          ordered_product.production_status = "制作完了"
          ordered_product.save
         end
          redirect_to admin_order_path(@order.id)
     elsif @order.update(order_params) && @order.order_status=="発送済み"
          @ordered_product.each do |ordered_product|
          ordered_product.production_status = "制作完了"
          ordered_product.save
         end
          redirect_to admin_order_path(@order.id)
     else
         render :show
     end
=======
         redirect_to admin_order_path(@order.id)
    elsif @order.update(order_params) && @order.order_status=="入金待ち"
         @ordered_product.each do |ordered_product|
         ordered_product.production_status = "制作不可"
         ordered_product.save
        end
         redirect_to admin_order_path(@order.id)
    elsif @order.update(order_params) && @order.order_status=="製作中"
         @ordered_product.each do |ordered_product|
         ordered_product.production_status = "製作中"
         ordered_product.save
        end
         redirect_to admin_order_path(@order.id)
    elsif @order.update(order_params) && @order.order_status=="発送準備中"
         @ordered_product.each do |ordered_product|
         ordered_product.production_status = "制作完了"
         ordered_product.save
        end
         redirect_to admin_order_path(@order.id)
    elsif @order.update(order_params) && @order.order_status=="発送済み"
         @ordered_product.each do |ordered_product|
         ordered_product.production_status = "制作完了"
         ordered_product.save
        end
         redirect_to admin_order_path(@order.id)
    else
        redirect_to admin_order_path(@order.id)
    end
>>>>>>> origin/develop
  end

  private
 def order_params
 params.require(:order).permit(:order_status)
 end

 def if_not_admin
   redirect_to admin_session_path unless admin_signed_in?
 end
<<<<<<< HEAD

  def ordered_product_params
   params.permit(:production_status)
 end
=======
>>>>>>> origin/develop

end
