require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:comments)
    should have_many(:todo_lists)
    should have_many(:todos)
  end
end

class NoviceTest < ActiveSupport::TestCase
  def setup
    @novice = users(:novice)
  end

  context 'associations' do
    should_not have_many(:campaigns)
  end

  test 'novice should be valid' do
    assert @novice.valid?
  end

  test 'novice username should be present' do
    @novice.username = '  '
    assert_not @novice.valid?
  end

  test 'novice email should be present' do
    @novice.email = '  '
    assert_not @novice.valid?
  end

  test 'novice type should be present' do
    @novice.type = '  '
    assert_not @novice.valid?
  end

  test 'profession attribute should be nil' do
    assert @novice.profession.nil?
  end

  test 'service attribute should be nil' do
    assert @novice.service.nil?
  end

  test 'status should be not_qualified' do
    assert @novice.status == 'not_qualified'
  end

  test 'status must be a recognised key' do
    assert_raises ArgumentError do
      @novice.status = 'Whatever'
    end
  end

  test 'calling "#campaign" should raise error' do
    assert_raises NoMethodError do
      @novice.campaigns
    end
  end
end

class ExpertTest < ActiveSupport::TestCase
  def setup
    @expert = users(:expert)
    @campaign = campaigns(:marketing)
  end

  context 'associations' do
    should have_many(:campaigns)
  end

  test 'expert should be valid' do
    assert @expert.valid?
  end

  test 'expert username should be present' do
    @expert.username = '  '
    assert_not @expert.valid?
  end

  test 'expert email should be present' do
    @expert.email = '  '
    assert_not @expert.valid?
  end

  test 'expert type should be present' do
    @expert.type = '  '
    assert_not @expert.valid?
  end

  test 'status should be qualified' do
    assert @expert.status == 'qualified'
  end

  test 'status must be a recognised key' do
    assert_raises ArgumentError do
      @expert.status = 'Whatever'
    end
  end

  test 'should have associated campaigns' do
    assert @expert.campaigns.include?(@campaign)
  end

  test 'associated campaigns should be destroyed' do
    assert_difference 'Campaign.count', -1 do
      @expert.destroy
    end
  end
end
