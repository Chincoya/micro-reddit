# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'Example Name', email: 'example@email.com')
    @post = Post.new(title: 'Title', content: 'Text', user_id: @user.id)
  end

  test 'SHould be valid' do
    assert @post.valid?
  end

  test 'User must exist on Db' do
    @post.user_id = 42
    assert_not @post.valid?
  end
end
