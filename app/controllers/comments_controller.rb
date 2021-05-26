class CommentsController < ApplicationController
  before_action :set_like

  def create
    if params[:topic_id]
      @topic = Topic.find(params[:topic_id])
      @comment = @topic.comments.build(comment_params)
      @comment.user_id = current_user.id
      @comment.save
      @comments = @topic.comments
      render :index_topic_comments
    elsif params[:post_id]
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.user_id = current_user.id
      @comment.save
      @comments = @post.comments
      render :index_post_comments
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    if @comment.topic_id
      @comments = @comment.topic.comments
      render :index_topic_comments
    elsif @comment.post_id
      @comments = @comment.post.comments
      render :index_post_comments
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :post_id, :user_id, :topic_id)
  end

  def set_like
    if params[:post_id]
      @post = Post.find(params[:post_id])
    end
  end
end
