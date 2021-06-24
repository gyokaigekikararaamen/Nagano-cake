class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
 def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path        #pathは設定したい遷移先へのpathを指定してください
    when Customer
      root_path              #ここもpathはご自由に変更してください
    end
 end
  
  def after_sign_out_path_for(resource)
    
     
      root_path              #ここもpathはご自由に変更してください
         #ここもpathはご自由に変更してください
    
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:kana_first_name,:kana_last_name,:postal_code,:address,:phone_number,:is_deleted])
  end
end
