class User < ApplicationRecord
  has_one :posts
  has_many :comments, through: :posts
  has_many :likes, through: :posts

  def recent_three_post
    posts.last(3)
  end
end
