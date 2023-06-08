class Post < ApplicationRecord
    belongs_to :User
    has_many :comments
    has_many :likes
end
