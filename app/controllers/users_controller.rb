class UsersController < ApplicationController
  def index
  end

  def show
  	@user = User.find(params[:id])
  	@address = @user.addresses.first
  	# ここから購入履歴
  	@orders = Order.where(user_id: @user.id).includes(:order_items) #入れ子型のeach文を作成するため
  end
  # 次回参考：https://qiita.com/blueplanet/items/05aa424cc7e5847e6c84

  def new
  end

  def edit
  end
end