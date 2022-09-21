class PostsController < ApplicationController
  
  def index; end

  def show 
    render :layout => 'users'
  end
end
