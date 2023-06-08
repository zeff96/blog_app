class Post < ApplicationRecord
    belongs_to :User
    has_many :comments
    has_many :likes

    def update_post_counter
        user.increment!(:post_counter)
    end

    def recent_five_comments
        comments.last(5)
    end
end
