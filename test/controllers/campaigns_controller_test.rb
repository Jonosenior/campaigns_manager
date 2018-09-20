require 'test_helper'

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @expert = users(:expert)
    @novice = users(:novice)
    @campaign = campaigns(:marketing)
  end

end
