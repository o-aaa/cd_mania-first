class OrderItemsController < ApplicationController
  def index
  	@orders = Order.page(params[:page]).includes(:order_items)
  	@order_item = OrderItem.find(1)
  end

  def thankyou
  	
  end
end
