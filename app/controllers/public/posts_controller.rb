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
    @comments = @post.comments
    @comment = current_user.comments.new
  end
  
   def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
   end

  def destroy
  end

  def post_params
    params.require(:post).permit(:title, :text, :image, :job, job_ids: [])
  end
end
