class Vote < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :contest
  validates :post_id, presence: true
  validates :contest_id, presence: true
  validates :user_id, presence: true
end
