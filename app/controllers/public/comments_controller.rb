class Public::CommentsController < ApplicationController

  def create
     @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: post_path(@comment.post_id))  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: post_path(@comment.post_id))  #同上
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    post = Post.find(params[:post_id])
    redirect_to post_path(post)
  end

   private
  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
