class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  # def new
  #   @comment = Comment.new
  #   @post = Post.find(params[:post_id])
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.update_comments_counter
    if @comment.save
      redirect_to user_post_path(current_user, @comment.post_id)
      flash[:notice] = 'Comment created succefully'
    else
      redirect_to user_post_comments_path
      flash[:notice] = 'Text field cannot be empty'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
