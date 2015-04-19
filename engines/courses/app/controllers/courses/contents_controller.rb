module Courses
  class ContentsController < ApplicationController

    def index
      @contents_facade = ContentsFacade.new(params[:course_id], self)
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
    end

    def update
    end

    def destroy
    end
  end
end
