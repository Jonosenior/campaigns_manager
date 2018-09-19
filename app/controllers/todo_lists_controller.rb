class TodoListsController < ApplicationController
  def show
    @campaign = Campaign.find(params[:id])
    @todo_lists = @campaign.todo_lists
  end

  def create
    @campaign = Campaign.find(params[:id])
    @todo_list = @campaign.todo_lists.create(todo_list_params)
  end
end
