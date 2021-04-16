require "rails_helper"

RSpec.describe User, :type => :model do

  it 'should not save user without all fields' do
    user = User.new()
    expect(user.save).to eq false
    expect(user.errors[:username].length).to be > 0
    expect(user.errors[:password].length).to be > 0
    expect(user.errors[:email].length).to be > 0
    expect(user.errors[:name].length).to be > 0
  end

  it 'should save user with proper fields' do
    user = User.new(username: 'Seth', password: 'supersecretpassword', email: 'seth@email.com', name: 'Seth')
    expect(user.save).to eq true
  end

  it 'should not save user if username and email are not unique' do
    user1 = User.new(username: 'Seth', password: 'supersecretpassword', email: 'seth@email.com', name: 'Seth')
    user2 = User.new(username: 'Seth', password: 'supersecretpassword', email: 'seth@email.com', name: 'Seth')
    expect(user1.save).to eq true
    expect(user2.save).to eq false
    expect(user2.errors[:username].length).to be > 0
    expect(user2.errors[:email].length).to be > 0
  end

end