require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "check items datafields function" do
    @item = Item.find_by id: 1
    assert @item.valid?
    assert @item.name == "item1"
    assert @item.category == "Men"
    assert @item.price == 15
    assert @item.itemdescription == "Smart Casual"
    assert @item.asseturl == "asseturl"
  end
end