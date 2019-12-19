# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'Example Name', email: 'example@email.com')
    @post = Post.create(title: 'Example', content: 'Text', user_id: @user.id)
    @comment = Comment.new(content: 'Example', user_id: @user.id, post_id: @post.id)
  end

  test 'Should be valid' do
    assert @comment.valid?
  end

  test 'User should exist in database' do
    @comment.user_id = 42
    assert_not @comment.valid?
  end

  test 'Email should exist in database' do
    @comment.post_id = 42
    assert_not @comment.valid?
  end
end
