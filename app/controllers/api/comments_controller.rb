class Api::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_authorization_check only: [:create]

  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comments = @post.comments

    render json: @comments
  end

  def create
    post = Post.find(params[:post_id])
    author = User.find(comment_params[:author_id])
    @comment = post.comments.new(text: comment_params[:text], author:)
    respond_to do |format|
      if @comment.save
        format.json { render json: @comment, location: user_post_url(post.author, post) }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :author_id)
  end
end
