class Genre < ApplicationRecord
  has_many :genre_users
  has_many :users, through: :genre_users
end
