class Genre < ApplicationRecord
  has_many :genre_users
  has_many :users, through: :genre_users
  has_many :genre_posts
  has_many :users, through: :genre_posts
end
