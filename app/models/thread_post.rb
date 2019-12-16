# frozen_string_literal: true

class ThreadPost < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  validates_associated :post
  validates_associated :user
end
