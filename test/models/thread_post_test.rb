# frozen_string_literal: true

require 'test_helper'

class ThreadPostTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'Example Name', email: 'example@email.com')
    @post = Post.create(title: 'Example', content: 'Text', user_id: @user.id)
    @thread_post = ThreadPost.new(content: 'Example', user_id: @user.id, post_id: @post.id)
  end

  test 'Should be valid' do
    assert @thread_post.valid?
  end

  test 'User should exist in database' do
    @thread_post.user_id = 42
    assert_not @thread_post.valid?
  end

  test 'Email should exist in database' do
    @thread_post.post_id = 42
    assert_not @thread_post.valid?
  end
end
