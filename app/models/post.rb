# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 80 }
  has_one_attached :image
  has_many :comments, as: :commentable
end
