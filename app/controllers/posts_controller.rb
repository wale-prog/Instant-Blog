class PostsController < ApplicationController
  load_and_authorize_resource
  # before_action :set_user, only: %i[index show new]
  # before_action :authenticate_user!, only: %i[new create]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'Post created succefully'
      redirect_to user_post_path(@user.id, @post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = 'Post deleted succefully'
      redirect_to user_posts_path(current_user)
    else
      flash[:alert] = 'Post could not be deleted'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
  end
end
