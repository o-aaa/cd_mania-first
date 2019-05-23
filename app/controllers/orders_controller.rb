class OrdersController < ApplicationController

  def index
  	@order = Order.new
	@product = session[:product]
  end

  def create
  end

  def confirmation
  end
end