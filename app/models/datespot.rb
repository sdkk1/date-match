class Datespot < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :lists, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :area, presence: true
  validates :price, presence: true
  validates :keyword, presence: true, length: { maximum: 50 }
  validates :point, length: { maximum: 255 }
  validates :caution, length: { maximum: 255 }

  mount_uploader :picture, PictureUploader
  validate :picture_size

  def feed_comment(datespot_id)
    Comment.where("datespot_id = ?", datespot_id)
  end

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "5MB以内にしてください")
    end
  end
end
