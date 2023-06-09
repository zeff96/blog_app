require 'rails_helper'

RSpec.describe User, type: :model do
  subject {User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')}

  before(:example) do
    Post.create(author: subject, title: 'Hello', text: 'This is my first post')
    Post.create(author: subject, title: 'there', text: 'This is my second post')
    Post.create(author: subject, title: 'Hello there again', text: 'This is my last post')
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

end
