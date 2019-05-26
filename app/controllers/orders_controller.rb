class OrdersController < ApplicationController

  def index
  	@carts = Cart.all
    @cart = current_user.carts
    @buy_count = params[:buy_count]
    @address = Address.find_by(user_id:current_user.id)
    # お支払い方法
    @order = Order.new
    # 合計計算
    @total_price = 0
    @carts.each do |cart|
      @total_price += cart.subtotal
    end
  end

  def create
  	@order = Order.new(params[:id])
  	@cart.user_id = current_user.id
  	@order.save
  end

  def confirmation
  end

private
  def cart_params
    params.require(:cart).permit(:id, :buy_count, :subtotal)
  end
  def order_params
    params.require(:order).permit(:payment, :delivery_status,
                    carts_attributes: [:id, :buy_count])
  end

end
