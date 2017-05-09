class ImagesController < ApplicationController
  include Postable

  def new
    @image = @post.images.new
  end

  def create
    @post.images.create(image_params)
    redirect_to @post
  end

  private

  def image_params
    params.require(:image).permit(:file)

  end

end
