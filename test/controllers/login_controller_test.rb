require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get login_login_url
    assert_response :success
  end
  
  test "user logged in" do
    post login_login_path, params: {username: "user1", password: "password"}
    assert session[:current_user_id]
  end
  
  test "user logged in redirecting" do
    post login_login_path, params: {username: "user1", password: "password"}
    assert_redirected_to main_main_path
  end
  
  test "should get logout" do
    get login_logout_url
    assert_redirected_to main_main_path
  end
  
  test "user logged out" do
    get login_logout_url
    assert session[:current_user_id] == nil
  end
  
  test "should get sign up" do
    get login_sign_up_url
    assert_response :success
  end
  
  test "user signed up" do
    post login_sign_up_url, params: {username: "test", email:"test@gmail.com" ,password: "password", repassword: "password"}
    assert session[:current_user_id]
  end
  
  test "user signed up redirecting" do
    post login_sign_up_url, params: {username: "test", email:"test@gmail.com" ,password: "password", repassword: "password"}
    assert_redirected_to main_main_path
  end
  
  test "user forgot_pwd " do
    post login_forgot_pwd_url, params: {email:"user1@gmail.com"}
    assert AccessToken.all.last.email ==  "user1@gmail.com"
  end
  
  test "sign in with token"  do
    post login_forgot_pwd_url, params: {email:"user1@gmail.com"}
    get "#{login_login_path}.token:#{AccessToken.all.last.token}"
    assert session[:current_user_id]
    assert_redirected_to main_main_path
  end
  
  
  test "should get forgot_pwd" do
    get login_forgot_pwd_url
    assert_response :success
  end

end
