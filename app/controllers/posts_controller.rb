class PostsController < ApplicationController
  def index
    @user = User.find(params[:author_id])
    @posts = Post.all
  end
end
