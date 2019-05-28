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
    # @order.address_id = params[:order][:address].to_i
    @order.user_id = current_user.id
    current_user.carts.each do |cart|
  	   cart.user_id = current_user.id
    end
  	 if @order.save
      redirect_to confirmation_path
     else
      @carts = Cart.all
      @cart = current_user.carts
      @buy_count = params[:buy_count]
      @address = Address.find_by(user_id:current_user.id)
      @addresses = current_user.addresses
      # 合計計算
      @total_price = 0
      @cart.each do |cart|
        @total_price += cart.subtotal
      end
      render :index
     end
  end

  def confirmation
    @order = Order.where(user_id: current_user.id).last
    @carts = Cart.where(user_id: current_user.id)
    @cart = current_user.carts
    # 合計計算
    @total_price = 0
    @cart.each do |cart|
      @total_price += cart.subtotal
    end
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

  def complete
    order = Order.find(params[:id])
    carts = Cart.where(user_id: current_user.id)
    carts.each do |cart|
      order_item = OrderItem.new
      order_item.cart_id = cart.id
      order_item.buy_price = (cart.product.price*1.08).floor
      order_item.order_id = order.id
      order_item.save()
    end
    order_items = OrderItem.where(order_id: order.id)
    if order_items.count == carts.count
      carts.delete_all
      redirect_to thankyou_path
    else
      flash[:danger] = "カート内容の更新に失敗しました。もう一度やり直してください。"
      order_items.delete_all
      redirect_to mycart_path
    end
  end

private
  def cart_params
    params.require(:cart).permit(:id, :buy_count, :product_id,
      products_attributes: [:price])
  end

  def order_params
    params.require(:order).permit(:payment, :delivery_status, :total_price, :address_id,
                    carts_attributes: [:id, :buy_count])
  end
  def order_item_params
    params.require(:order_item).permit(:cart_id, :buy_price, :order_id)
  end

end

