class CommentsController < ApplicationController
  load_and_authorize_resource
  
  def create
    if @comment.save
      flash[:notice] = 'Comment created succesfully!'
      redirect_to user_post_path(current_user, post)
    else
      flash[:alert] = 'Comment creation failed!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy

    flash[:notice] = 'Comment deleted successfully!'
    redirect_to user_path(current_user), status: :see_other
  end

  private

  def comment_param
    params.require(:comment).permit(:text)
  end
end
