class ContestsController < ApplicationController
  def index
    @contests = Contest.all
  end

  def show
    @contest = Contest.find(params[:id])
    @host_user = @contest.user
    @posts = Post.where(contest_id: @contest.id)
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = current_user.contests.build(contest_params)
    if @contest.save
      redirect_to contest_path(@contest.id)
    else
      render 'new'
    end
  end

  private

  def contest_params
    params.require(:contest).permit(:name, :image, :period, :condition)
  end
  
end
