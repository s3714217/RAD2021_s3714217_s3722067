require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  
  test "should direct to login" do
    post add_to_path
    assert_redirected_to login_login_path
  end
  
  test "should create a cart item" do
    post login_login_path, params: {username: "user1", password: "password"}
    post add_to_path(), params: {item_id: "1", size: "Small", colour: "RED", quantity: 1, user_id: "1", id: 3}
    @cart =  Cart.find_by id: 3
    assert @cart
  end
  
  test "should remove all cart items" do
    @cart = Cart.where(:user_id => 1)
    assert_equal(@cart.size , 2)
    post remove_items_path, params: {userId: "1"}
    assert_equal(@cart.size , 0)
  end
  
  test "should remove a item from cart items" do
    @cart = Cart.where(:user_id => 1)
    assert_equal(@cart.size , 2)
    post remove_item_path, params: {cartitemId: "1", itemId: "1"}
    assert_equal(@cart.size , 1)
  end
  
end