# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example Name', email: 'example@mail.com')
  end

  test 'Should be valid' do
    assert @user.valid?
  end

  test 'Name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'Email must be present' do
    @user.email = ''
    assert_not @user.valid?
  end

  test "Name shouldn't be too long" do
    @user.name = 'Dad' * 20
    assert_not @user.valid?
  end

  test "Email shouldn't be too long" do
    @user.email = ('lol' * 83) + '@example.com'
    assert_not @user.valid?
  end
end
