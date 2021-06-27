class CustomersController < ApplicationController

   before_action :authenticate_customer!

  def show
    @customer = Customer.find(current_customer.id)
  end

  def new
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to customer_path
  end

  def unsubscribe
  end

  def hide
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name,:kana_first_name,:kana_last_name,:postal_code,:address,:phone_number,:email)
  end

end
