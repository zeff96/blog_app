require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:example) do
    @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  subject {Post.create(author: @first_user, title: 'Hello', text: 'This is my first post')}

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments counter should be greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comments counter should be zero by default' do
    expect(subject.comments_counter).to eq 0
  end

  it 'likes counter should be greater than or equal to zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes counter should be zero by default' do
    expect(subject.likes_counter).to eq 0
  end

  it 'should update post' do
    expect(@first_user.update_post_counter).to eq 1
  end

  it 'should have five recent comments' do
    Comment.create(post: subject, author: @first_user, text: 'Hi Tom!' )
    Comment.create(post: subject, author: @first_user, text: 'Hi there!' )
    Comment.create(post: subject, author: @first_user, text: 'long time!' )
    Comment.create(post: subject, author: @first_user, text: 'how have you been!' )
    Comment.create(post: subject, author: @first_user, text: 'Hi Tom again!' )

    expect(subject.recent_five_comments.length).to eq 5
  end
end
