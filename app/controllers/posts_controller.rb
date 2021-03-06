class PostsController < ApplicationController
  def new
    @post = Post.new
    @genres = Genre.all
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
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
    respond_to do |format|
      format.html
      # link_toメソッドをremote: trueに設定したのでリクエストはjs形式で行われる（詳しくは参照記事をご覧ください）
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
    params.require(:post).permit(:place, :image, :content,  { genre_ids: [] })
  end
end
