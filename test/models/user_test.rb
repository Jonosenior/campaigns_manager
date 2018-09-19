require 'test_helper'

class NoviceTest < ActiveSupport::TestCase
  def setup
    # @expert = users(:expert)
    @novice = users(:novice)
    @campaign = campaigns(:marketing)
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


  # context 'associations' do
  #   should have_many(:campaigns)
  # end

end

class ExpertTest < ActiveSupport::TestCase
  def setup
    @expert = users(:expert)
    # @novice = users(:novice)
    @campaign = campaigns(:marketing)
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

  # context 'associations' do
  #   should have_many(:campaigns)
  # end
end
