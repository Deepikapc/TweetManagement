class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!
  

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do 
    redirect_to root_path, notice: "Unauthorized Access"
  end

  private
  def after_sign_out_path_for(resource_or_scope)
     new_user_session_path
  end

  protected
  
  def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
	    user_params.permit({ keys: [] }, :role_id,:email, :password, :password_confirmation,:username)
	  end
	end  
end

