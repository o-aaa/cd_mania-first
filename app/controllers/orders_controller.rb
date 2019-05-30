class OrdersController < ApplicationController

  def index
  	@carts = Cart.where(user_id: current_user.id)
    @user_cart = Cart.without_deleted.last
    @buy_count = params[:buy_count]
    @address = Address.find_by(user_id:current_user.id)
    @addresses = current_user.addresses
    # お支払い方法
    @order = Order.new
    # 合計計算
    @total_price = 0
    @carts.each do |cart|
      @total_price += cart.subtotal
    end
  end

  def create
  order_find = Order.where(user_id: current_user.id).last #追加
    if order_find.update_flag == 2 # 追加
    	@order = Order.new(order_params)
      @order.user_id = current_user.id
      current_user.carts.each do |cart|
    	   cart.user_id = current_user.id
      end
    	 if @order.save
          redirect_to confirmation_path
       else
        @carts = Cart.where(user_id: current_user.id)
        @addresses = current_user.addresses
        # 合計計算
        @total_price = 0
        @cart.each do |cart|
          @total_price += cart.subtotal
        end
        render :index
       end
    else # ここからまるまる追加
      @order = Order.where(user_id: current_user.id).last # 変更
      current_user.carts.each do |cart|
         cart.user_id = current_user.id
      end
       if @order.update(order_update_params) # 変更
          redirect_to confirmation_path
       else
        @carts = Cart.where(user_id: current_user.id)
        @addresses = current_user.addresses
        # 合計計算
        @total_price = 0
        @cart.each do |cart|
          @total_price += cart.subtotal
        end
        render :index
       end
    end
  end



  def confirmation
    @order = Order.where(user_id: current_user.id).last
    @carts = Cart.where(user_id: current_user.id)
    # 合計計算
    @total_price = 0
    @carts.each do |cart|
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
    order = Order.where(user_id: current_user.id).last # 変更
    carts = Cart.where(user_id: current_user.id)
    carts.each do |cart|
      order_item = OrderItem.new
      order_item.cart_id = cart.id
      order_item.buy_price = (cart.product.price*1.08).floor
      order_item.order_id = order.id
      order_item.save
    end
    # order_items = OrderItem.where(order_id: order.id)
    if order.update_flag = 1 #変更
      carts.delete_all
      order.update_flag = 2 # 追加
    binding.pry
      order.update(order_update_params)
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
  def order_update_params
    params.require(:order).permit(:payment, :delivery_status, :total_price, :address_id, :user_id, :update_flag)
  end
  #枚数を配列で渡すため(orders_index=>orders_confirmation)
end

