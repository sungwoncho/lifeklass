module Courses
  class CoursesController < ApplicationController
    layout :layout

    skip_before_action :authenticate_user!, only: :index
    before_action :authenticate_mentor!, only: [:new, :edit, :create, :update, :destroy]
    before_action :set_course, only: [:show, :edit, :update, :destroy]

    def index
      @courses_facade = CoursesFacade.new(params[:search], self)
    end

    def show
      @course = CourseFacade.new(course, self)
    end

    def new
      @course = Course.new
    end

    def edit
      authorize_instructor!
    end

    def create
      course = Courses::CreateCourseService.call(current_mentor, course_params)

      redirect_to course
    end

    def update
      authorize_instructor!
    end

    def destroy
      authorize_instructor!
      @course.destroy
    end

    private
      def set_course
        @course = CoursePresenter.new(course, view_context)
      end

      def course
        Course.find(params[:id])
      end

      def course_params
        params[:course].permit(:title, :description)
      end

      def layout
        action_name == 'show' ? 'course' : 'application'
      end
  end
end
