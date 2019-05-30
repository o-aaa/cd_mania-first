class OrderItemsController < ApplicationController
  def index
  	@order = Order.new
  	@orders = Order.page(params[:page]).per(20).reverse_order.includes(:order_items) #入れ子型のeach文を作成するため.includes(:order_items)
    @carts = Cart.only_deleted.all
  end

end
