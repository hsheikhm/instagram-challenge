require 'time_ago_in_words'

class ApplicationController < ActionController::Base

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [:username, :email, :image, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  protect_from_forgery with: :exception
end
