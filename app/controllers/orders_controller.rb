class OrdersController < ApplicationController

   def index
    @carts = Cart.all
    @user = current_user.id
    @cart = current_user.carts
    @buy_count = params[:buy_count]
    @address = Address.find_by(user_id:current_user.id)
    @addresses = current_user.addresses


  end

  def create
    @order_item = Order_item.new
  end

  def confirmation
  end

private
  def cart_params
    params.require(:cart).permit(:id, :buy_count)
  end

  def order_params
    params.require(:order).permit(:payment, :delivery_status,
                    carts_attributes:[:id, :buy_count])
  end

  def address_params
    params.require(:address).permit(:post_num, :address, :delivery_last_name, :delivery_first_name, :delivery_last_name_kana, :delivery_first_name_kana, :user_id, :shipping_address, address_ids: [])
  end

end