class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.post.new(post_params)
    respond_to do |format|
      format.html do
        if @post.save
          flash[:sucess] = 'post created successfully!'
          redirect_to user_post_path(current_user, @post)
        else
          flash[:error] = 'post not created!'
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
