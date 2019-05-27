class OrdersController < ApplicationController

  def index
  	@carts = Cart.all
    @cart = current_user.carts
    @buy_count = params[:buy_count]
    @address = Address.find_by(user_id:current_user.id)
    @addresses = current_user.addresses
    # お支払い方法
    @order = Order.new
    # 合計計算
    @total_price = 0
    @cart.each do |cart|
      @total_price += cart.subtotal
    end
  end

  def create
  	@order = Order.new(order_params)
    @order.address_id = params[:order][:address].to_i
    current_user.carts.each do |cart|
  	   cart.user_id = current_user.id
    end
  	@order.save
    redirect_to confirmation_path
  end

  def confirmation
  end

  def delivery_status
    order = Order.find(params[:id])
    if order.update(order_params)
      flash[:success] = "配送ステータスを更新しました！"
      redirect_to index_path
    else
      flash[:danger] = "更新できませんでした..."
      redirect_to index_path
    end
  end

private
  def cart_params
    params.require(:cart).permit(:id, :buy_count, :product_id,
      products_attributes: [:price])
  end

  def order_params
    params.require(:order).permit(:payment, :delivery_status, :total_price,
                    carts_attributes: [:id, :buy_count])
  end

end

