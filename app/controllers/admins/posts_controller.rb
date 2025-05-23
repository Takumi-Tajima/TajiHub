class Admins::PostsController < Admins::ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = Post.default_order
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to admins_posts_path, notice: 'ポストを登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admins_posts_path, notice: 'ポストを編集しました', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to admins_posts_path, notice: 'ポストを削除しました', status: :see_other
  end

  private

  def set_post
    @post = Post.find(params.expect(:id))
  end

  def post_params
    params.expect(post: %i[title content published])
  end
end
