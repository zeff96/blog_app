class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author, :comments).where(author_id: params[:user_id])
  end

  def show
    @post = Post.includes(:author, :comments, :likes).where(author_id: params[:user_id], id: params[:id]).first
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params.merge(comments_counter: 0, likes_counter: 0))
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
