class Contest < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :period, presence: true
  validates :condition, presence: true
  validates :image, presence: true
  validates :user_id, presence: true
end
