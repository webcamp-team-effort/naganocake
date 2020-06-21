class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private
    #sign in後のredirect先変更
    def after_sign_in_path_for(resource)
      root_path
    end

    #sign out後のredirect先変更
    def after_sign_out_path_for(resource)
      root_path
    end

    #sin up時の登録情報追加
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name , :first_name , :last_kana_name , :first_kana_name , :postcode , :address , :phone_number])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    end

end