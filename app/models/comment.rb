class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :topic, optional: true
  validates :comment_content, presence: true
end
