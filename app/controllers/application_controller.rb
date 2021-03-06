class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource_or_scope)
  	root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :image])
    devise_parameter_sanitizer.permit(:log_in, keys: [:name, :email, :password])
  end

end
