class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def unsubscribe
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    redirect_to admin_users_path
  end

 private
  def user_params
    params.require(:user).permit(:name, :gender, :age, :email, :profile_image,)
  end
end
