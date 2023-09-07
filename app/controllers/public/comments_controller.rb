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
  end

   private
  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
