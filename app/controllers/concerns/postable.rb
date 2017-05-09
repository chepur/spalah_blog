module Postable
  extend ActiveSupport::Concern

  included do
    before_action :set_post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
