require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Example", last_name: "User", email: "user@example.com",
    password: "carrots", password_confirmation: "carrots")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "first name should be present" do
    @user.first_name = "   "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    # 255 is the max that a DB can store
    @user.email = "h" * 256
    assert_not @user.valid?
  end

  test "first name should not be too long" do
    #50 is arbitrary ...but works for styling
    @user.first_name = "h" * 51
    assert_not @user.valid?
  end

  test "email should be unique" do
    #dup is a ruby method that duplicates the attr of the user
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end


  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com USER_at_foo.COM first@foo. foo@baz_bar.cn foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "password should be present (not blank)" do
    @user.password = @user.password_confirmation = "         "
    assert_not @user.valid?
  end

  test "password should not be too short" do
    @user.password = @user.password_confirmation = "some"
    assert_not @user.valid?
  end



end
