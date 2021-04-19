class ContestsController < ApplicationController
  before_action :timepass,only:[:index]

  def index
    @contests = Contest.where(status: 0).order(period: "ASC")
  end

  def index_closed
    @contests = Contest.where(status: 1).order(period: "DESC")
    render :contests
  end

  def show
    @contest = Contest.find(params[:id])
    @host_user = @contest.user
    @posts = Post.where(contest_id: @contest.id)
    @prize_posts = Post.where(contest_id: @contest.id).order(votes_num: "DESC").first(3)
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
