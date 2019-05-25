class OrderItemsController < ApplicationController
  def index
  	@orders = Order.page(params[:page]).includes(:order_items)
  end

  def thankyou
  	
  end
end
