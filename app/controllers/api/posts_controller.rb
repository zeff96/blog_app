class Api::PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author, :comments).where(author_id: params[:user_id])

    render json: @posts
  end
end
