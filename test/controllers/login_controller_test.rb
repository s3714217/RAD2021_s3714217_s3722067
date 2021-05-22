require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get update_details" do
    get login_update_details_url
    assert_response :success
  end

end
