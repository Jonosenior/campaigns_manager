class CommentsController < ApplicationController
  def create
    commentable_type = params[:comment][:commentable_type]
    commentable_id = params[:comment][:commentable_id]
    @commentable = commentable_type.constantize.find(commentable_id)
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to @commentable
    else
      flash.now[:danger] = "Invalid information."
      render 'new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:id, :title, :user_id)
  end
end
