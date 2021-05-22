require 'test_helper'

class CartTest < ActiveSupport::TestCase
  
  test "check cart item fields and object are valid" do
    @Cart = Cart.find_by id: 1
    assert @Cart.valid?
    assert @Cart.item_id == 1
    assert @Cart.user_id  == 1
  end
  
  test "check invalid cart item with user that does not exist" do
    @Cart = Cart.new( item_id: 1, user_id: 0, size: 'Medium', colour: 'RED', quantity: 1)
    assert_not !@Cart.valid?
  end
  
  test "check invalid cart item with item that does not exist" do
    @Cart = Cart.new( item_id: 0, user_id: 1, size: 'Medium', colour: 'RED', quantity: 1)
    assert_not !@Cart.valid?
  end
  
end