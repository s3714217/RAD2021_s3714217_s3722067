require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get checkout" do
    get main_checkout_url
    assert_redirected_to login_login_path
  end
  
  test "should direct to productdetails" do
    post to_productdetails_path
    assert_redirected_to main_productdetails_path
  end
  
  test "should save item to the uset" do
    post login_login_path, params: {username: "user1", password: "password"}
    post to_saved_path, params: {itemId: "1"}
    @user = User.find_by id: 1
    @item = Item.find_by id: 1
    assert @user.items.include?(@item) 
  end
  
  test "should remove saved item" do
    post login_login_path, params: {username: "user1", password: "password"}
    post to_saved_path, params: {itemId: "1"}
    @user = User.find_by id: 1
    @item = Item.find_by id: 1
    post removed_saved_path, params: {itemId: "1"}
    assert_not @user.items.include?(@item) 
  end
  
  test "should toggle saved item on" do
    @user = User.find_by id: 1
    @item = Item.find_by id: 1
    post login_login_path, params: {username: "user1", password: "password"}
    post toggle_saved_path, params: {itemId: "1"}
    assert @user.items.include?(@item) 
  end
  
  test "should toggle saved item off" do
    @user = User.find_by id: 1
    @item = Item.find_by id: 1
    post login_login_path, params: {username: "user1", password: "password"}
    post to_saved_path, params: {itemId: "1"}
    post toggle_saved_path, params: {itemId: "1"}
    assert_not @user.items.include?(@item) 
  end

end