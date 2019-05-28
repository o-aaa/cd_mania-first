class OrderItemsController < ApplicationController
  def index
  	@order = Order.new
  	@orders = Order.page(params[:page]).includes(:order_items).per(3) #入れ子型のeach文を作成するため
    @carts = Cart.only_deleted.all
  end

  def thankyou
  	
  end
end
