require 'test_helper'

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @expert = users(:expert)
    @novice = users(:novice)
    @campaign = campaigns(:marketing)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Campaign.count' do
      post campaigns_path, params: { campaign: { title: 'Marketing', tags: 'social, priority', estimated_duration: '3 months'}}
    end
    assert_redirected_to root_path
  end

  test 'should redirect create when user is novice' do
    login_as @novice
    assert_no_difference 'Campaign.count' do
      post campaigns_path, params: { campaign: { title: 'Marketing', tags: 'social, priority', estimated_duration: '3 months'}}
    end
    assert_redirected_to root_path
  end

  test 'should allow create when user is expert' do
    login_as @expert
    assert_difference 'Campaign.count', 1 do
      post campaigns_path, params: { campaign: { title: 'Marketing', tags: 'social, priority', estimated_duration: '3 months'}}
    end
    assert_redirected_to campaign_url(Campaign.last)
  end
end
