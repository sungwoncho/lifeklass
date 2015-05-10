class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_mentor
    return unless current_user
    Mentors::Mentor.find_by(user_id: current_user.id)
  end

  def authenticate_mentor!
    current_mentor.present?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up, &permitted_parameters)
    devise_parameter_sanitizer.for(:account_update, &permitted_parameters)
  end

  private

  def permitted_parameters
    Proc.new { |u| u.permit(:email, :password, :password_confirmation, :current_password, :name) }
  end
end
