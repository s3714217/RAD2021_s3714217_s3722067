
require 'test_helper'
class UserTest < ActiveSupport::TestCase
  test "test create user with valid email " do
    @user = User.new(name: "user3", email: "user11@gmail.com", password: "Rails2021", password_confirmation: "Rails2021")
    assert @user.valid?
  end
  
  test "test create user with existing email " do
    @user = User.new(name: "user3", email: "user1@gmail.com", password: "Rails2021", password_confirmation: "Rails2021")
    assert_not @user.valid?
  end
  
  test "test create user with invalid email " do
    @user = User.new(name: "user3", email: "u@ser1@gmail.com", password: "Rails2021", password_confirmation: "Rails2021")
    assert_not @user.valid?
  end
  
  test "test create user with empty email " do
    @user = User.new(name: "user3", email: "", password: "Rails2021", password_confirmation: "Rails2021")
    assert_not @user.valid?
  end
  
  test "test create user with empty name " do
    @user = User.new(name: "user3", email: "user1@gmail.com", password: "Rails2021", password_confirmation: "Rails2021")
    assert_not @user.valid?
  end
  
  test "test user authenticate " do
    @user = User.new(name: "", email: "user1@gmail.com", password: "Rails2021", password_confirmation: "Rails2021")
    assert @user.authenticate("Rails2021")
  end
    
  test "test user invalid password " do
    @user = User.new(name: "user3", email: "user1@gmail.com", password: "Rails2021", password_confirmation: "Rails2022")
    assert_not @user.valid?
  end
  
  test "test user invalid name length " do
    @user = User.new(name: "abcdefghijklmnopqrstuvwxyz", email: "user1@gmail.com", password: "Rails2021", password_confirmation: "Rails2021")
    assert_not @user.valid?
  end
  
  test "test add rating to user" do
    @user = User.find_by id: 1
    assert_not @user.has_rating?
    rating = Rating.new(user_id: 1, ratingscore: "score" )
    rating.save()
    @user = User.find_by id: 1
    assert @user.has_rating?
  end
  
  test "test add item to user" do
    @user = User.find_by id: 1
    @item = Item.find_by id: 1
    @user.items << @item
    assert @user.items.include?(@item) 
  end

end