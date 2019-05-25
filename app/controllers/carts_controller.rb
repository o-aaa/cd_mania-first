class CartsController < ApplicationController

  def create
  	@cart = Cart.new(cart_params)
  	@cart.user_id = current_user.id
  	@cart.product_id = params[:product_id]
  	@cart.save
  	redirect_to mycart_path
  end

private
  def product_params
  	params.require(:product).permit(:id)
  end

  def cart_params
    params.require(:cart).permit(:buy_count)
  end
end
