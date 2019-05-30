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

  def first_edit
    @address = current_user.addresses.first
  end

  def first_edit_update
    address = current_user.addresses.first
    if address.update(address_update_params)
      flash[:success] = "住所を更新しました。"
      redirect_to user_path(current_user.id)
    else
      flash[:danger] = "住所を更新できませんでした..."
      render action: :first_edit
    end
  end

  private
  def address_params
  	params.require(:address).permit(:post_num, :address, :delivery_last_name, :delivery_first_name, :delivery_last_name_kana, :delivery_first_name_kana, :user_id, :shipping_address, address_ids: [])
  end
  def address_update_params
    params.require(:address).permit(:post_num, :address)
  end

end
