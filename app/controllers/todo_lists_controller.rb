class TodoListsController < ApplicationController
  load_and_authorize_resource

  def show
    @todo_list = TodoList.find(params[:id])
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @todo_list = current_user.todo_lists.new(todo_list_params)
    @todo_list.campaign = @campaign
    if @todo_list.save
      flash[:success] = "Todo List added!"
      redirect_to @campaign
    else
      flash.now[:danger] = "Invalid information."
      render 'new'
    end
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @todo_list = @campaign.todo_lists.new
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:id, :title)
  end
end
