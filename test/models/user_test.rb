require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "should not save user without all fields" do
    user = User.new()
    assert_not user.save, "Saved the user without all fields"

    assert_not_empty user.errors[:username], "Did not raise error for blank username"
    assert_not_empty user.errors[:password], "Did not raise error for blank password"
    assert_not_empty user.errors[:email], "Did not raise error for blank email"
    assert_not_empty user.errors[:name], "Did not raise error for blank name"
  end

  test "saves user with proper fields" do
    user = User.new(username: 'Seth', password: 'supersecretpassword', email: 'seth@email.com', name: 'Seth')
    assert user.save
  end

  test "should not save user if username and email are not unique" do
    user1 = User.new(username: 'Seth', password: 'supersecretpassword', email: 'seth@email.com', name: 'Seth')
    user2 = User.new(username: 'Seth', password: 'supersecretpassword', email: 'seth@email.com', name: 'Seth')
    assert user1.save, "Did not save user with unique username and password"
    assert_not user2.save, "Saved user without unique username and password"

    assert_not_empty user2.errors[:username], "Did not raise error for duplicate username"
    assert_not_empty user2.errors[:email], "Did not raise error for duplicate email"
  end

end