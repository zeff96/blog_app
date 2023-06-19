FactoryBot.define do
  factory :user do
    name { 'Tom' }
    photo { 'https://unsplash.com/photos/F_-0BxGuVvo' }
    bio { 'Teacher from Mexico.' }

    factory :user_with_posts do
      transient do
        post_count {3}
      end
  
      after(:create) do |user, evaluator|
        create_list(:post, evaluator.post_count, user: user)
      end
    end
  end
end