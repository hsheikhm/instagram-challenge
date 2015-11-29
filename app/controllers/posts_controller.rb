class PostsController < ApplicationController

  def index
    @posts = Post.all
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save ? (redirect_to posts_path) : (render 'new')
  end

  def post_params
    params.require(:post).permit(:image, :title)
  end

end
