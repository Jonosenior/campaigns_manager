require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @campaign_comment = comments(:campaign)
    @no_user_comment = comments(:no_user)
    @todo_list_comment = comments(:todo_list)
    @parentless_comment = comments(:parentless)
    @double_parent_comment = comments(:double_parent)

  end

  test 'campaign comment should be valid' do
    assert @campaign_comment.valid?
  end

  test 'should require user' do
    assert_not @no_user_comment.valid?
  end

  test 'todo list comment should be valid' do
    assert @todo_list_comment.valid?
  end

  test 'should require title' do
    @campaign_comment.title = '  '
    assert_not @campaign_comment.valid?
  end

  test 'should require either campaign or todo list' do
    assert_not @parentless_comment.valid?
  end

  test 'should not have both campaign and todolist' do
  #   binding.pry
    assert_not @double_parent_comment.valid?
  end

end
