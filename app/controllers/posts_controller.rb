class PostsController < ApplicationController
  def index
    @user = User.find(params[:author_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:author_id])
    @post = @user.posts.find(params[:id])
  end
end
