class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
  end

  def destroy
     post = Post.find(params[:id]).destroy
    # post.destroy
     redirect_to admin_user_path(post.user)
  end
end
