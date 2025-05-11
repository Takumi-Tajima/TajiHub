class PostsController < ApplicationController
  def index
    @posts = Post.published.default_order
  end

  def show
    @post = Post.published.find(params.expect(:id))
  end
end
