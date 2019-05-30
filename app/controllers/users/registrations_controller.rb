# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
   def create
     super
       resource.addresses.build
       resource.addresses.first.post_num = params[:user][:address][:post_num]
       resource.addresses.first.address = params[:user][:address][:address]
       begin
          resource.save!
       rescue ActiveRecord::RecordInvalid => invalid
          puts invalid.record.errors
       end
   end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up) do |params|
     #binding.pry
      #ユーザー（入力者）が新規登録をするとき変更できるのは、sign_up(deviseのデフォルト設定のカラム、emailやpasswordなど)に加え、追加した独自カラムnicknameとsexのみ変更を許可
      #加えて子モデルaddress_listのprefectures_master_idカラムのみ変更を許可
      params.permit(:sign_up, kays: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_num, :user_flag, :user_status, address_attributes: [:post_num, :address, :shipping_address]])
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end



  # 参考：https://teratail.com/questions/136856
  # 参考：https://teratail.com/questions/136641
  # Addressモデルへのデータ送信で必要
  # GET /resource/sign_up
  # superは親クラス定義されている同名のメソッドを呼ぶことが出来る
end
