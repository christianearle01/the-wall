class Message < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :message, presence: true, length: {minimum: 11}
  validates :user, presence: true
end
