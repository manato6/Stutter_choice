class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to user_path
  end

  def show
  end

  def destroy
  end
  
  def Post_params
    params.require(:post).permit(:title, :text, :image, :profession) 
  end
end
