class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :datespot, counter_cache: :favorites_count

  scope :sort_desc, -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :datespot_id, presence: true
end
