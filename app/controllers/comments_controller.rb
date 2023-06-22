class Api::CommentsController < ApplicationController
  # load_and_authorize_resource
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comments = @post.comments

    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.new(author: current_user, **comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_path(post.author, post), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to user_post_path(post.author, post), notice: 'Comment was not created.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy

    flash[:notice] = 'Comment deleted successfully!'
    redirect_to user_post_path(current_user), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
