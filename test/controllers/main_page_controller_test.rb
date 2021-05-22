require 'test_helper'

class MainPageControllerTest < ActionDispatch::IntegrationTest
  test "should get main_page" do
    get main_page_main_page_url
    assert_response :success
  end

end
