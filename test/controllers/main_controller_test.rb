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
  
  test "user logged out" do
    get login_logout_url
    assert session[:current_user_id] == nil 
  end
  
  test "user logged in" do
    post login_login_path, params: {username: "user1", password: "password"}
    assert session[:current_user_id] != nil 
  end
  
  test "search_text" do
    post main_all_collection_path, params: {search_text: "item1"}
    assert_response 200
  end
  
  test "size filter" do
    post main_all_collection_path, params: {radio: "Large"}
    assert_response 200
  end
  
  test "tag filter" do
    post main_all_collection_path, params: {tag: "Dress"}
    assert_response 200
  end
  
  test "colour filter" do
    post main_all_collection_path, params: {colour: "Black"}
    assert_response 200
  end
  
  test "combine filter" do
    post main_all_collection_path, params: {colour: "Black", tag: "Dress", radio: "Large"}
    assert_response 200
  end
  
  test "selected category men" do
    post main_all_collection_path, params: {cate: "Men"}
    assert_response 200
  end
  
  test "selected category new" do
    post main_all_collection_path, params: {cate: "New"}
    assert_response 200
  end
  
end
