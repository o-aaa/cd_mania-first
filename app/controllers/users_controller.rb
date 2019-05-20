class UsersController < ApplicationController
  def index
  end

  def show
  	@user = User.find(params[:id])
  	@address = @user.addresses.first
  	# ここから購入履歴
  	@orders = Order.where(user_id: @user.id)
  end

  def new
  end

  def edit
  end
end