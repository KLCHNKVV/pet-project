require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'Daniel Kliuchnikov', email: 'dk@gmail.com', password: 'foobar', password_confirmation: 'foobar')
  end

  test 'email must be unique' do
    user_clone = @user.dup
    user_clone.email = @user.email.upcase
    @user.save
    assert_not user_clone.valid?
  end

  test 'user valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '    '
    assert_not @user.valid?
  end

  test 'name should not be long' do
    @user.name = 'x' * 41
    assert_not @user.valid?
  end

  test 'email should not be long' do
    @user.email = 'x' * 254 + '@example.com'
    assert_not @user.valid?
  end

  test 'password should not be blank' do
    @user.password = @user.password_confirmation = ' ' * 21
    assert_not @user.valid?
  end

  test 'password should have min length' do
    @user.password = @user.password_confirmation = 'x' * 5
    assert_not @user.valid?
  end

  test 'email addresses should  be all downcase' do
    crazy_mail = 'DaNiel@FoO.ORg'
    @user.email = crazy_mail
    @user.save
    assert_equal crazy_mail.downcase!, @user.reload.email
  end

end
