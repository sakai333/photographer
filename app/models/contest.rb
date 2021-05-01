class Contest < ApplicationRecord
  enum status: { open: 0, closed: 1 }
  belongs_to :user
  has_many :posts
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :period, presence: true
  validates :condition, presence: true
  validates :user_id, presence: true
  has_many :votes, dependent: :destroy
end
