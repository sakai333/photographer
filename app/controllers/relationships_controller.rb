class RelationshipsController < ApplicationController
  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    render :follow
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    render :follow
  end
end
