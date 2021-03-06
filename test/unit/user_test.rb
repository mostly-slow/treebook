require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name " do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end
  
  test "a user should enter a last name " do
      user = User.new
      assert !user.save
      assert !user.errors[:last_name].empty?
    end
    
  test "a user should enter a profile name" do
      user = User.new
      assert !user.save
      assert !user.errors[:profile_name].empty?
    end
  
  test "a user should have a unique profile name" do
    user = User.new
    user.profile_name = users(:asdf).profile_name
    assert !user.save
    puts user.errors.inspect
    assert !user.errors[:profile_name].empty?
  end
  
  test "a user should have a profile name" do
    user = User.new
    user.profile_name = "profile name"
    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("is not the correct format")
  end
  
  test "a user should have a correctly formatted profile name" do
    user = User.new(first_name: "asdfasdf", last_name: "asdfasdf", email: "test123@test.com")
    user.password = user.password_confirmation = "asdfasdfasdf"
    user.profile_name = "profile-name"
   
    assert user.valid?
  end
end
