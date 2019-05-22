class UsersController < ApplicationController

  def index
  	@users = User.all

  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to action: 'index'
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
  	@user = User.find(params[:id])
  	@address = @user.addresses.first
  end

  def update
  	@user = User.find(params[:id])
  	@address = @user.addresses.first
  	if @user.update(user_params)
       flash[:notice] = "ユーザー情報を編集しました。"
       redirect_to user_path(@user.id)
    else
      flash[:denger] = "編集に失敗しました..."
      render action: :edit
    end
  end


  private
  # ストロングパラメーター
  def user_params
  	params.require(:user).permit(
  		:last_name,
  		:first_name,
  		:last_name_kana,
  		:first_name_kana,
  		:phone_num,
  		:email,
  		addresses_attributes: [:id, :user_id, :post_num, :address, :_destroy]
  		)
  end


end