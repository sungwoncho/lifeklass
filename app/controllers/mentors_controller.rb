class MentorsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @mentors = Mentor.page(params[:page])
  end

  def show

  end
end
