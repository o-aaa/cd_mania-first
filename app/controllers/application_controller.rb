class ApplicationController < ActionController::Base
	# devise新規登録で追加するデータ
	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
		# binding.pry
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_num, :user_flag, :user_status, addresses_attributes: [:post_num, :address] ])
	end
end