FactoryBot.define do
  factory :user do
    name { 'Tom' }
    photo { 'https://unsplash.com/photos/F_-0BxGuVvo' }
    bio { 'Teacher from Mexico.' }

    factory :user_with_posts do
      transient do
        post_count { 3 }
        comments_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:post_with_comments, evaluator.post_count, author: user, comments_count: evaluator.comments_count)
      end
    end
  end
end

FactoryBot.define do
  factory :post do
    title { 'hello there' }
    text { 'this is my first post' }
    comments_counter { 0 }
    likes_counter { 0 }
    association :author, factory: :user

    factory :post_with_comments do
      transient do
        comments_count { 5 }
      end

      after(:create) do |post, evaluator|
        create_list(:comment, evaluator.comments_count, post:)
      end
    end
  end
end

FactoryBot.define do
  factory :comment do
    text { 'Hi Tom!' }
    association :author, factory: :user
    association :post
  end
end
