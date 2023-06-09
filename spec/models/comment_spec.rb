require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:example) do
    @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
  end

  subject {Like.create(author: @user, post: @post)}

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'should update comments counter' do
    expect(@post.update_comments_counter).to eq 1
  end
end
