class CommentsController < ApplicationController

  def create
    @post=Post.find(params[:post_id])
    @comment=@post.comments.new(comments_params)
    if user_signed_in?
    str=current_user.email
    str1=str[0..str.index('@')-1]
    @comment.username=str1
    @comment.save
  end
    redirect_to post_path(@post)
  end

  def destroy
    @post=Post.find(params[:post_id])
    @comment=@post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post,success: 'Коментарій був успішно видалений'
  end

  private
  def comments_params
    params.require(:comment).permit(:username,:body,:id,:post_id)
  end
  
end
