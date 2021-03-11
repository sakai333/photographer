class Post < ApplicationRecord
  belongs_to :user
  has_many :genre_posts, dependent: :destroy
  has_many :genres, through: :genre_posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }
  mount_uploader :image, ImageUploader

  def liked_by?(user)
    if user
      likes.where(user_id: user.id).exists?
    end
  end
end
