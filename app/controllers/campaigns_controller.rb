class CampaignsController < ApplicationController
  load_and_authorize_resource
  
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
    @todo_lists = @campaign.todo_lists
    @comments = @campaign.comments
  end

  def create
    @user = current_user
    @campaign = @user.campaigns.new(campaign_params)
    if @campaign.save
      flash[:success] = "Campaign added!"
      redirect_to @campaign
    else
      flash.now[:danger] = "Invalid information."
      render 'new'
    end
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      flash[:success] = "Campaign updated!"
      redirect_to @campaign
    else
      flash.now[:danger] = "Invalid information."
      render 'edit'
    end
  end

  def destroy
    Campaign.find(params[:id]).destroy
    flash[:success] = "Restaurant deleted."
    redirect_to root_path
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :tags, :estimated_duration,
                                      todo_lists_attributes:[:id, :title, :_destroy])
  end


end
