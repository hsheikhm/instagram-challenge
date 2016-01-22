class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    @posts = Post.all
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.time = Time.now
    @post.save ? (redirect_to posts_path) : (render 'new')
  end

  def post_params
    params.require(:post).permit(:image, :title)
  end

end
