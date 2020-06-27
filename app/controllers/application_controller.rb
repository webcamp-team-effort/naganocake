class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search_product
  protect_from_forgery with: :exception


  private
    def set_search_product
      # 検索バー表示のために常に@qを生成する
      # 検索時以外params[:q]はnilだが、空のransackオブジェクト生成の動作になる
      @q = Product.ransack(params[:q])
    end

    #sign in後のredirect先変更
      def after_sign_in_path_for(resource)
      case resource
        when Admin
          admins_top_path
        when Customer
          root_path
      end
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