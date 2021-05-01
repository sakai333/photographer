class CommentsController < ApplicationController
  before_action :set_like
  
  def create
    if params[:topic_id]
      @topic = Topic.find(params[:topic_id])
      @comment = @topic.comments.build(comment_params)
      @comment.user_id = current_user.id
      @comment.save
      @comments = @comment.topic.comments
    elsif params[:post_id]
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.user_id = current_user.id
      @comment.save
      @comments = @comment.post.comments
    end
    render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    if @comment.topic_id
      @comments = @comment.topic.comments
    elsif @comment.post_id
      @comments = @comment.post.comments
    end
    render :index
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :post_id, :user_id, :topic_id)
  end

  def set_like
    @post = Post.find(params[:post_id])
  end
end
