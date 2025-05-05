class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  scope :default_order, -> { order(updated_at: :desc, created_at: :desc) }
end
