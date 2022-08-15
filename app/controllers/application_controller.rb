class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(a)
    if a.seller?
      sellers_path
    elsif a.buyer?
      buyers_path
    else
      redirect_to root_path
    end 
  end
 
  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :city, :state, :address, :postal_code, :role, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :city, :state, :address, :postal_code, :role, :email, :password, :current_password)}
  end
end
