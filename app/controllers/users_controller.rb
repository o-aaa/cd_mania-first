class UsersController < ApplicationController
  def index
  end

  def show
  	@user = User.find(params[:id])
  	@address = Address.find_by(user_id: @user.id)
  	# ここから購入履歴
  	@orders = Order.page(params[:page]).reverse_order
  end

  def new
  end

  def edit
  end
end