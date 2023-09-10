class Public::UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
   @posts = Post.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def favorites
    @user = current_user
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    
  end
  
    private
  def user_params
    params.require(:user).permit(:name, :gender, :age, :profile_image,)
  end
  
end
