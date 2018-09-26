require 'test_helper'

class TodoListsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @marketing_todos = todo_lists(:marketing_todos)
    @marketing_campaign = campaigns(:marketing)
    @novice = users(:novice)
    @expert = users(:expert)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'TodoList.count' do
      post campaign_todo_lists_path(@marketing_campaign, todo_list: { title: @marketing_todos.title, user:@marketing_todos.user })
    end
    assert_redirected_to root_path
  end

  test 'should show todo list when not logged in' do
    get campaign_todo_list_path(@marketing_campaign, @marketing_todos)
    assert_response :success
  end

  test 'novices should be able to create' do
    login_as @novice
    assert_difference 'TodoList.count' do
      post campaign_todo_lists_path(@marketing_campaign, todo_list: { title: @marketing_todos.title, user:@marketing_todos.user })
    end
    assert_redirected_to(@marketing_campaign)
  end

  test 'experts should be able to create' do
    login_as @expert
    assert_difference 'TodoList.count' do
      post campaign_todo_lists_path(@marketing_campaign, todo_list: { title: @marketing_todos.title, user:@marketing_todos.user })
    end
    assert_redirected_to campaign_path(@marketing_campaign)
  end



end
