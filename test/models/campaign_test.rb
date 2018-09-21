require 'test_helper'

class CampaignTest < ActiveSupport::TestCase
  def setup
    @campaign = campaigns(:marketing)
    @expert = users(:expert)
  end

  test 'should be valid' do
    assert @campaign.valid?
  end

  test 'should require title' do
    @campaign.title = '  '
    assert_not @campaign.valid?
  end

  test 'should link to expert' do
    assert @campaign.expert == @expert
  end

  test 'should require expert_id' do
    @campaign.expert_id = nil
    assert_not @campaign.valid?
  end
end
