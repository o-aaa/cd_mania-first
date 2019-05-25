class AddressesController < ApplicationController

  def new
  	@address = Address.new
  end

  def create
  	address = Address.new(address_params)
  	address.user_id = current_user.id
  	address.shipping_address = 1
  	if address.save
  		flash[:success] = "別の送り先住所を登録しました。"
  		redirect_to mycart_path(current_user.id)
  	else
  		flash[:danger] = "別の送り先住所を登録できませんでした..."
  		render action: :new
  	end

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
  	params.require(:address).permit(:post_num, :address, :delivery_last_name, :delivery_first_name, :delivery_last_name_kana, :delivery_first_name_kana, :user_id, :shipping_address)
  end

end
