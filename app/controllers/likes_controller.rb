class LikesController < ApplicationController
  def create
    @like = current_user.likes.new
    @like.post_id = params[:post_id]
    if @like.save
      redirect_to user_post_likes_path
      flash[:notice] = 'Like added successfully'
    else
      flash[:alert] = 'Error!'
    end
  end
end
