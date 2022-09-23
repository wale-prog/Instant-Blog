class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @article = Post.new
  end

  def create
    @article = current_user.posts.new(post_params)   
    if @article.save
      flash[:notice] = 'Post created succefully'
      redirect_to "/users/#{current_user.id}/posts/#{@article.id}"
    else
      render :new, status: :unprocessable_entity
    end  
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter )
  end

end
