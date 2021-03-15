class ContestsController < ApplicationController
  def index
  end

  def show
    @user = User.find(1)
    @posts = Post.all
  end

  def new
  end

  def create
  end
end
