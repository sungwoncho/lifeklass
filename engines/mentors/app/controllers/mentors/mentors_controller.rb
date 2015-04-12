module Mentors
  class MentorsController < ApplicationController

    before_action :set_mentor, only: :show

    def show
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
