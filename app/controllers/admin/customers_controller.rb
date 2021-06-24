class Admin::CustomersController < ApplicationController
 before_action :if_not_admin
  def index
     @customer = Customer.page(params[:page]).reverse_order

  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(admin_customer_params)
    redirect_to admin_customers_path(customer.id)
  end

  private
  def admin_customer_params
     params.require(:customer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :phone_number, :email, :is_deleted)
  end
  def if_not_admin
   redirect_to admin_session_path unless admin_signed_in?
  end


end