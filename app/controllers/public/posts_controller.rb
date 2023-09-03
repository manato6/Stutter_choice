class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to user_path(current_user)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def destroy
  end

  def post_params
    params.require(:post).permit(:title, :text, :image, :job, job_ids: [])
  end
end
