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
end
