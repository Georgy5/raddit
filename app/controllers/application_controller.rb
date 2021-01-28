class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For Rails 5.2 and higher protect_from_forgery is enabled by default
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
