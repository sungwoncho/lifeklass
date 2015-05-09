module Courses
  class CommentsController < ApplicationController

    def create
      @comment = Courses::Comment.new(comment_params.merge(content_id: current_content.id, owner: current_user))

      if @comment.save!
        redirect_to :back
      end
    end

    def update
      
    end

    def destroy

    end

    private

    def comment_params
      params[:comment].permit(:body, :parent_id)
    end
  end
end
