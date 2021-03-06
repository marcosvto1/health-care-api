class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :kind, :cell_phone, :crm])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :cell_phone, :crm])
  end
end
