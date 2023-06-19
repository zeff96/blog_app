require 'rails_helper'

user = FactoryBot.create(:user_with_posts)

RSpec.describe 'user_show_page', type: :feature do
  scenario 'it display username' do
    visit user_path(user)
    expect(page).to have_content(user.name)
  end
end