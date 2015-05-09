module Courses
  class CommentsController < ApplicationController

    before_action :set_comment, only: [:update, :destroy]

    def create
      @comment = Courses::Comment.new(comment_params.merge(content_id: current_content.id, owner: current_user))

      if @comment.save!
        redirect_to [current_course, current_menu, current_content]
      end
    end

    def update
      @comment.update!(comment_params)
      redirect_to [current_course, current_menu, current_content]
    end

    def destroy
      @comment.archive!
      redirect_to [current_course, current_menu, current_content]
    end

    private

    def comment_params
      params[:comment].permit(:body, :parent_id)
    end

    def set_comment
      @comment = Courses::Comment.find(params[:id])
    end
  end
end
