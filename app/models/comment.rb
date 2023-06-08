class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comments_conuter
    post.increment!(:comments_cuonter)
  end
end
