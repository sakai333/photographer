class LikesController < ApplicationController
  before_action :set_like

  def create
    current_user.likes.create(post_id: params[:post_id])
  end

  def destroy
    Like.find_by(post_id: params[:post_id], user_id: current_user.id).destroy
  end

  private

  def set_like
    @post = Post.find(params[:post_id])
  end
end
