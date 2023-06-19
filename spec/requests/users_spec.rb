require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before do
      get '/users'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:id' do
    let(:user) { User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.') }

    before do
      get "/users/#{user.id}"
    end

    it 'returns succesfull response' do
      expect(response).to be_successful
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end
  end
end
