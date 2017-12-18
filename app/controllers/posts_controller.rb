class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def create
    @post = Post.create(post_params)

    redirect_to posts_path
  end

  def destroy
  end

  def update
  end

  private


  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
