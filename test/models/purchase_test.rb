require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  
  test "check purchase fields and object are valid" do
    @purchase = Purchase.find_by id: 1
    assert @purchase.valid?
    assert @purchase.item_id == 1
    assert @purchase.user_id  == 1
  end
  
  test "check invalid purchase with user that does not exist" do
    @purchase = Purchase.new( item_id: 1, user_id: 0, size: 'Medium', colour: 'RED', quantity: 1)
    assert_not @purchase.valid?
  end
  
  test "check invalid purchase with item that does not exist" do
    @purchase = Purchase.new( item_id: 0, user_id: 1, size: 'Medium', colour: 'RED', quantity: 1)
    assert_not @purchase.valid?
  end
  
end