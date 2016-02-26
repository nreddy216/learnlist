require 'test_helper'

class ListTest < ActiveSupport::TestCase

  def setup
    @user = User.create(first_name: "John", last_name: "Jones", email: "johnjones@gmail.com", password: "carrots")
    @list = List.new(title: "First list", user_id: @user.id)

  end

  test "should be valid" do
    assert @list.valid?
  end

  test "user id should be present" do
    @list.user_id = nil
    assert_not @list.valid?
  end



end
