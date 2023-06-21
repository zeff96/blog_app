class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @like = post.likes.new(author: current_user)
    if @like.save
      flash[:notice] = 'Likes added succesfully!'
      redirect_to user_post_path(current_user, post)
    else
      flash[:alert] = 'Likes not added!'
      render :new, status: :unprocessable_entity
    end
  end
end
