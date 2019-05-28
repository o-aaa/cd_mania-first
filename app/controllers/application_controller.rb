class ApplicationController < ActionController::Base
	# devise新規登録で追加するデータ
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search


	# 検索フォーム
	def set_search
		@search = Product.ransack(params[:q]) #ransackタグで検索機能を実装
		@search_products = @search.result.page(params[:page]) #結果を返す。kaminariでページャ機能つける
  	end


	# devise用ストロングパラメーター
	def configure_permitted_parameters
		# binding.pry
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_num, :user_flag, :user_status, addresses_attributes: [:id, :post_num, :address, :shipping_address] ])
	end

	# 管理者限定
	def adminonly
		if (current_user.user_flag == 0)
			redirect_to products_path
		end

	end
end