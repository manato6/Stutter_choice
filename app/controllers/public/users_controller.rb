class Public::UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def favorites
  end
  
    private
  def user_params
    params.require(:user).permit(:name, :gender, :age, :profile_image,)
  end
  
end
