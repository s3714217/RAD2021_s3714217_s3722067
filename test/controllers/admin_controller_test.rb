require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get admin_admin_url
    assert_redirected_to main_main_path
  end

end
