class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)    
    @comment.post_id = params[:post_id]
    @comment.update_comments_counter
    if @comment.save
      flash[:notice] = 'Comment created succefully'
      redirect_to user_post_comments_path
    else
      redirect_to user_post_comments_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end