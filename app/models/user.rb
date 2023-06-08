class User < ApplicationRecord
    has_one :posts
    has_many :comments, through: :posts
    has_many :likes, through: :posts
end
