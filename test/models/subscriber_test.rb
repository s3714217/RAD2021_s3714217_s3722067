require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase
  
  test "test create subscriber with valid email " do
    @subscribe = Subscriber.new(email: "user11@gmail.com")
    assert @subscribe.valid?
  end
  
  test "test create subscriber with existing email " do
    @subscribe = Subscriber.new(email: "user1@gmail.com")
    assert_not @subscribe.valid?
  end
  
  test "test create subscriber with invalid email " do
    @subscribe = Subscriber.new(email: "u@ser1@gmail.com")
    assert_not @subscribe.valid?
  end
  
  test "test create subscriber with empty email " do
    @subscribe = Subscriber.new(email: "")
    assert_not @subscribe.valid?
  end
  
  test "test create subscriber email downcase" do
    @subscribe = Subscriber.new(email: "USER12@gmail.com")
    assert_not @subscribe.email  == "user12@gmail.com"
  end
  
end
