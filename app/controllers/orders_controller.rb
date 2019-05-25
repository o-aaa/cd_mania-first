class OrdersController < ApplicationController

  def index
  	@carts = Cart.all
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
end