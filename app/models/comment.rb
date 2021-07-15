class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :user
  validates :comment, presence: true, length: {minimum: 11}
  validates :message, :user, presence: true
end
