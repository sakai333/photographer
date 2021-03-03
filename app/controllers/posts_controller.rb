class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
  end
  
  def index
    @posts = Post.all
    @post = Post.first
  end

  private

  def post_params
    params.require(:post).permit(:place, :image, :content,  { genre_ids: [] })
  end
end
