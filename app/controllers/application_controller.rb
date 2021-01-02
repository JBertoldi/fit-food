class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username photo])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username photo])
  end

  def user_root_path
    profile_path
  end
end
