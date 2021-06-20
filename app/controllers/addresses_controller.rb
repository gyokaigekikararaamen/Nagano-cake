class AddressesController < ApplicationController

  def index
    @addresses = Address.find(current_customer.id)
    @address = Address.new
  end

  def create
    address = Address.new(address_params)
    address.save
    redirect_to address_path
  end

  def edit
    @address.find(params[:id])
  end

  def update
    address.find(params[:id])
    address.update(address_params)
    redirect_to address_path
  end

  def destoy
    address = Address.find(params[:id])
    address.destroy
    redirect_to address_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
