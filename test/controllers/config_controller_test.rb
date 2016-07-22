require 'test_helper'

class ConfigControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get config_index_url
    assert_response :success
  end

end
