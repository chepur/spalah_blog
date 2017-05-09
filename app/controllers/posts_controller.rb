class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @posts = Post.order(id: :desc).page params[:page]
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
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post was updated!'
      redirect_to @post
    else
      render 'edit'
    end

  end

  def show
  end

  def destroy
    @post.destroy

    redirect_to posts_path
    flash[:success] = 'Post was deleted!'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, images_attributes: [:id, :file, :_destroy])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
