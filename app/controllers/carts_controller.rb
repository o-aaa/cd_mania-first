class CartsController < ApplicationController

  def create
  	@cart = Cart.new
  	@cart.user_id = current_user.id
  	@cart.save
  	redirect_to mycart_path
  end


end
