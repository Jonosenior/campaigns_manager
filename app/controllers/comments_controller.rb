class CommentsController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @comment = @campaign.comments.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @comment = @campaign.comments.new(comment_params)
    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to @campaign
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
