class PostsController < ApplicationController
  def new
    @post = Post.new
    @genres = Genre.all
    if params[:contest_id]
      @contest = Contest.find(params[:contest_id])
    end
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      if @post.contest_id
        redirect_to contest_path(@post.contest_id)
      else  
        redirect_to posts_path
      end  
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def index
    @posts = Post.all
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:place, :image, :content,  { genre_ids: [] }, :contest_id)
  end
end
