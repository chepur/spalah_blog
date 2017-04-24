class PostsController < ApplicationController

  def index
    @posts = Post.all
    @posts = Post.order(:id).page params[:page]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post was created!"
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = 'Post was updated!'
      redirect_to @post
    else
      render 'edit'
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
    flash[:success] = 'Post was deleted!'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :remove_image)
  end

end
