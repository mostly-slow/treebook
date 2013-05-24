require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "that a status requires content" do
    status = Status.new
    assert !status.save
    assert !status.errors[:content].empty?
  end
  
  test "status's content is a least 2 letters" do
    status = Status.new
    status.content = 'h'
    assert !status.save
    assert !status.errors[:content].empty?
  end
  
  test "status has user id" do
    status = Status.new
    status.content = "hello world"
    assert !status.save
    assert !status.errors[:user_id].empty?
  end
end
