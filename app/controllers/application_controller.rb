class ApplicationController < ActionController::Base
  before_action :update_allowed_params, if: :devise_controller?
  before_action :authenticate_user!

  def update_allowed_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name  email password password_confirmation])
  end

  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
