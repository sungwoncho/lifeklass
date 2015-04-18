class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def current_mentor
    return unless current_user
    Mentors::Mentor.find_by(user_id: current_user.id)
  end

  def authenticate_mentor!
    current_mentor.present?
  end
end
