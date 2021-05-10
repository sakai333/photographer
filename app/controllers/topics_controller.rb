class TopicsController < ApplicationController
  before_action :logged_in_user
  
  def index
    @topics = Topic.all.order(created_at: :desc)
  end

  def show
    @post = Post.last
    @topic = Topic.find(params[:id])
    @comment = Comment.new
    @comments = @topic.comments.order(created_at: :desc)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      redirect_to topic_path(@topic.id)
    else
      render 'new'
    end
  end

  def destroy
    Topic.find(params[:id]).destroy
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :image, :content)
  end
end
