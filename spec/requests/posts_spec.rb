require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    let(:user) { User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')}

    before do
      get "/users/#{user.id}/posts"
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('List of all posts')
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(name: 'John Doe') }
    let(:post) { user.posts.create(title: 'My Post', content: 'Some content') }

    before do
      get :show, params: { user_id: user.id, id: post.id }
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Placeholder text')
      # Replace 'Placeholder text' with the expected text in the response body
    end
  end
end
