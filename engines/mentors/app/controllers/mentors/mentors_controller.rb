module Mentors
  class MentorsController < ApplicationController

    before_action :set_mentor, only: :show

    def show
    end

    def new
      @mentor = Mentors::Mentor.new
    end

    def create
      @mentor = current_user.build_mentor

      if @mentor.save!
        redirect_to mentors_app.mentor_path(@mentor)
      end
    end

    private

    def set_mentor
      @mentor = MentorPresenter.new(mentor)
    end

    def mentor
      Mentor.find(params[:id])
    end
  end
end
