class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :username, :email, :password, :password_confirmation　]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

   def authenticate_user
     if @current_user == nil
     flash[:notice] = "ログインが必要です"
     redirect_to("/users/login")
     end
   end

   def forbid_login_user
     if @current_user
       flash[:notice] = "すでにログインしています"
       redirect_to("/")
     end
   end
end
