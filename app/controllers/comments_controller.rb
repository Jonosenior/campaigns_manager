class CommentsController < ApplicationController
  def new
    @campaign = params[:campaign_id]
    @comment = @campaign.comments.new
  end

  def create
  end
end
