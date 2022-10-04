class Post < ApplicationRecord
  validates :title, presence: true , length:{maximum: 80}
  has_one_attached :image
end
