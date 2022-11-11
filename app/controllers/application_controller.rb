class ApplicationController < ActionController::Base
  before_action :update_allowed_params, if: :devise_controller?

  def update_allowed_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name  email password password_confirmation])
  end
end
