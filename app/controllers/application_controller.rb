class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  # ログイン後の画面遷移先を記述
  def after_sign_in_path_for(resource)
    case resource
    when User
      user_path(current_user)
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
