class OrderItemsController < ApplicationController
  def index
  	@orders = Order.page(params[:page]).includes(:order_items)
  	@order = Order.new
  end

  def thankyou
  	
  end
end
