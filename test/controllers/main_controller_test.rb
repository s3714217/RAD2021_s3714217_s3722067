require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get checkout" do
    get main_checkout_url
    assert_response :success
  end

end
