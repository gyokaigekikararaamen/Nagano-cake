class Admin::CustomersController < ApplicationController
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
    customer.update
    redirect_to admin_edit_customer_path(customer.id)
  end

end
