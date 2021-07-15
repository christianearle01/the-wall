class User < ApplicationRecord
    has_many :messages
    has_many :comments
    validates :username, presence: true, uniqueness: true, length: {minimum: 6}
end
