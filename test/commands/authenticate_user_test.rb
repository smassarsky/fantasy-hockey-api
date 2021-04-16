require "test_helper"

class AuthenticateUserTest < ActiveSupport::TestCase

  user = User.create(username: 'Seth', password: 'supersecretpassword', email: 'seth@email.com', name: 'Seth')

  

  test 'should not authenticate user with bad credentials' do

    command = AuthenticateUser.call('notavalidusername', 'notavalidpassword')
    assert_not command.success?, 'Authenticated user with invalid credentials'

    command = AuthenticateUser.call('Seth', 'notavalidpassword')
    assert_not command.success?, 'Authenticated user with invalid password'
    

  end

end