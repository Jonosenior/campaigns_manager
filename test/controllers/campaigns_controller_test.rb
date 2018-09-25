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
    assert_redirected_to new_user_session_url
  end

end
