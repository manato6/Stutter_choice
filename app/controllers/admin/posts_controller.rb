class Admin::PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
  end

  def destroy
  end
end
