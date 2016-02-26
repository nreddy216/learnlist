require 'test_helper'

class ListTest < ActiveSupport::TestCase

  def setup
    @user = User.create(first_name: "John", last_name: "Jones", email: "johnjones@gmail.com", password: "carrots")
    #have to make a list THROUGH its association with user
    #build returns an object in memory but doesn't modify database
    @list = @user.lists.build(title: "First list")

  end

  test "should be valid" do
    assert @list.valid?
  end

  test "user id should be present" do
    @list.user_id = nil
    assert_not @list.valid?
  end

  test "title should be present" do
    @list.title = nil
    assert_not @list.valid?
  end

  test "title should be at most 80 characters" do
    @list.title = "a" * 81
    assert_not @list.valid?
  end

  test "order should be most recent first" do
    assert_equal lists(:most_recent), List.first
  end



end
