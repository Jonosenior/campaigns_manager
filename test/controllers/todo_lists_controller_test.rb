require 'test_helper'

class TodoListsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @marketing_todos = todo_lists(:marketing_todos)
    @marketing_campaign = campaigns(:marketing)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'TodoList.count' do
      post new_campaign_todo_list_path, params: { todo_list: { title: 'Some things to work on', user: 'novice', campaign: 'marketing', campaign_id: 2 }}
    end
    assert_redirected_to root_path
  end

  test 'should show todo list when not logged in' do
    get campaign_todo_list_path(@marketing_campaign, @marketing_todos)
    assert_response :success
  end

end
