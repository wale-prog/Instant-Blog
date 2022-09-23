class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end