class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :published, inclusion: { in: [true, false] }

  scope :default_order, -> { order(updated_at: :desc, created_at: :desc) }
  scope :published, -> { where(published: true) }

  before_validation :check_title_or_content

  private

  def check_title_or_content
    if title.blank? || content.blank?
      errors.add(:base, '公開するにはタイトルまたは内容が必要です。')
      throw(:abort)
    end
  end
end
