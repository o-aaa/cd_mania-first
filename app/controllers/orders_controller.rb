class OrdersController < ApplicationController

  def index
  	@carts = Cart.all
    @cart = current_user.carts
    @buy_count = params[:buy_count]
    @address = Address.find_by(user_id:current_user.id)
  end

  def create
  	@order = Order.new
  	@cart.user_id = current_user.id
  	@order.save
  end

  def confirmation
  end

private
  def cart_params
    params.require(:cart).permit(:id, :buy_count)
  end
  def order_params
    params.require(:order).permit(:payment, :delivery_status,
                    carts_attributes: [:id, :buy_count])
  end

end
