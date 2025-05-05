class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  scope :default_order, -> { order(:created_at) }
end
