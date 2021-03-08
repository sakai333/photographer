class LikesController < ApplicationController
  def create
    current_user.likes.create(post_id: params[:post_id])
    redirect_to root_path
  end
  def destroy
    Like.find_by(post_id: params[:post_id], user_id: current_user.id).destroy
    redirect_to root_path
  end
end
