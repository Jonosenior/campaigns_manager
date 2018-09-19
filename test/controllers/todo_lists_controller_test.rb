require 'test_helper'

class TodoListsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get todo_lists_show_url
    assert_response :success
  end

  test "should get new" do
    get todo_lists_new_url
    assert_response :success
  end

end
