class AddressesController < ApplicationController

  def new
  end

  def edit
  	@address = Address.find(params[:id])
  end

  def update
  	@address = Address.find(params[:id])
  	@address.update(address_params)
  end

  private
  def address_params
  	params.require(:address).permit(:post_num, :address)
  end

end
