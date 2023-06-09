class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, default: 0
  has_many :likes, default: 0

  def update_post_counter
    user.increment!(:post_counter)
  end

  def recent_five_comments
    comments.last(5)
  end
end
