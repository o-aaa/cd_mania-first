class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  def index
  	@users = User.all

  end

  def destroy
    user = User.find(params[:id])
      if current_user.user_flag == 1
        user.destroy
        redirect_to action: 'index'
      else
        user.destroy
        redirect_to '/'
      end
  end

  def show
  	@user = User.find(params[:id])
  	@address = @user.addresses.first
  	# ここから購入履歴
  	@orders = Order.where(user_id: @user.id).includes(:order_items) #入れ子型のeach文を作成するため


    @sales = OrderItem.sum(:buy_price)
    # 該当月の絞り込みを追加予定。現在は全合計のみ
  end
  # 次回参考：https://qiita.com/blueplanet/items/05aa424cc7e5847e6c84

  def new
  end

  def edit
  	@user = User.find(params[:id])
  	@address = @user.addresses.first
  end

  def delete_confirmation
  end

  def update
  	@user = User.find(params[:id])
  	@address = @user.addresses.first
  	if @user.update(user_params)
       flash[:success] = "ユーザー情報を編集しました。"
       redirect_to user_path(@user.id)
    else
      flash[:danger] = "編集に失敗しました..."
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

# 編集者の制限を追加

  def correct_user
    user = User.find(params[:id])
    if current_user.id == user.id
    elsif current_user.user_flag == 1
    else
      redirect_back(fallback_location: root_path)
    end
  end

end