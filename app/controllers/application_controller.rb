class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :require_verification, unless: :devise_controller?

  def require_verification
  	if !user_signed_in?
  		redirect_to new_user_session_path
  	else
  		if !current_user.approved
  			redirect_to destroy_user_session_path
  		end
  	end
  end

  def require_admin_session
  	if !current_user.admin
  		redirect_to destroy_user_session_path
  	end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:company, :ein, :resale_number, :purchase_name, :first_name, :last_name, :title, :email, :password, :password_confirmation) }
  end
end
