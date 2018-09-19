class TodoListsController < ApplicationController
  def show
    @campaign = Campaign.find(params[:id])
    @todo_lists = @campaign.todo_lists
  end

  def create
    binding.pry
    @campaign = Campaign.find(params[:id])
    @todo_list = @campaign.todo_lists.create(todo_list_params)
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @todo_list = @campaign.todo_lists.new
    # binding.pry
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:id, :title)
                                      # todo_lists_attributes:[:id, :title, :_destroy])
  end
end
