require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:example) do
    @user = User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post')
  end

  subject { Like.new(author: @user, post: @post) }

  it 'name should be present' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'title should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'should update likes counter' do
    subject.save
    expect(@post.likes_counter).to eq 1
  end
end
