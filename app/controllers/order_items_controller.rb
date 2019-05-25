class OrderItemsController < ApplicationController
  def index
  	@orders = Order.page(params[:page]).includes(:order_items)
  	# @order = Order.find(1)
  	# @address = @orders.address
  end

  def thankyou
  	
  end
end
