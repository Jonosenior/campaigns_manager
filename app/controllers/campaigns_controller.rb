class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
    @todo_lists = @campaign.todo_lists
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      flash[:success] = "Campaign added!"
      redirect_to @campaign
    else
      flash.now[:danger] = "Invalid information."
      render 'new'
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :tags, :estimated_duration,
                                      todo_lists_attributes:[:id, :title, :_destroy])
  end


end
