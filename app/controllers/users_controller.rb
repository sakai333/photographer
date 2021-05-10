class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :index, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @num_first = @posts.where(prize: 1).count
    @num_second = @posts.where(prize: 2).count
    @num_third = @posts.where(prize: 3).count
  end

  def index
    @users = User.all
  end

  def following
    @index_title = "フォロー一覧"
    @user = User.find(params[:id])
    @users = @user.following
    render :follow_user
  end

  def follower
    @index_title = "フォロワー一覧"
    @user = User.find(params[:id])
    @users = @user.followers
    render :follow_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @genres = Genre.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation, :comment, :image, :camera,  { genre_ids: [] })
  end
end
