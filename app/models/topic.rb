class Topic < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
end
