class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_many :microposts, dependent: :destroy
  mount_uploader :image, ImageUploader
  has_many :genre_users, dependent: :destroy
  has_many :genres, through: :genre_users
  accepts_nested_attributes_for :genre_users, allow_destroy: true
  has_many :posts, dependent: :destroy
end
