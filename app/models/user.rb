class User < ApplicationRecord
  has_many :posts, foreign_key: :author
  has_many :comments, foreign_key: :author
  has_many :likes, foreign_key: :author

  def recent_three_post
    posts.last(3)
  end
end
