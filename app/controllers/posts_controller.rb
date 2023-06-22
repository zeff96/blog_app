class Api::PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author, :comments).where(author_id: params[:user_id])

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:author, :comments, :likes).find_by(author_id: @user.id, id: params[:id])

    if @post
      @comment = Comment.new
      @like = Like.new
    else
      flash[:alert] = 'Post not found!'
      redirect_to user_post_path(@user, params[:id])
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params.merge(comments_counter: 0, likes_counter: 0))
    respond_to do |format|
      format.html do
        if @post.save
          flash[:notice] = 'Post created successfully!'
          redirect_to user_post_path(current_user, @post)
        else
          flash[:alert] = 'Post not created!'
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @post.destroy

    flash[:notice] = 'Post deleted succesfully!'
    redirect_to user_path(current_user), status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
