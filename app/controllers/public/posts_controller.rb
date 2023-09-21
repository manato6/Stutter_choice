class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  # def create
  #   @post = Post.new(post_params)
  #   @post.user_id = current_user.id
  #   @post.save
  #   redirect_to user_path(current_user)
  # end

  def index
    @posts = params[:job_id].present? ? Job.find(params[:job_id]).posts : Post.all
    if params[:keyword]
      @posts = @posts.where("title LIKE ?", "%#{params[:keyword]}%")
    else
      @posts = @posts
    end
    @keyword = params[:keyword]
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
      redirect_to user_path(current_user) # 投稿に成功した時ユーザーページに遷移する
    else
      render :new # 投稿に失敗した時もう一度フォームに戻る
    end
   end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user)
  end

  def post_params
    params.require(:post).permit(:title, :text, :image, :job, job_ids: [])
  end
end
