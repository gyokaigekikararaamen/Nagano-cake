class AddressesController < ApplicationController
   before_action :authenticate_customer!

  def index
    @addresses = current_customer.addresses.page(params[:page]).reverse_order
    @address = Address.new
  end

  def create
    @addresses = current_customer.addresses.page(params[:page]).reverse_order
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save

    else
      @addresses = current_customer.addresses.page(params[:page]).reverse_order
      render  "index"
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
    redirect_to addresses_path
    else
    render "edit"
    end
  end

  def destroy
    @addresses = current_customer.addresses.page(params[:page]).reverse_order
    address = Address.find(params[:id])
    address.destroy
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
