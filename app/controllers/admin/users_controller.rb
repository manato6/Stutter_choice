class Admin::UsersController < ApplicationController

  def index
    @user = User.all
  end

  def unsubscribe
  end

 private
  def user_params
    params.require(:user).permit(:name, :gender, :age, :email, :profile_image,)
  end
end
