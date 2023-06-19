require 'rails_helper'

user = FactoryBot.create(:user_with_posts)

RSpec.describe 'user_show_page', type: :feature do
  scenario 'it display username' do
    visit user_path(user)
    expect(page).to have_content(user.name)
  end

  scenario 'display user profile picture' do
    visit user_path(user)
    expect(page).to have_css("img[src='#{user.photo}']")
  end

  scenario 'display number of posts' do
    visit user_path(user)
    expect(page).to have_content(user.post_counter)
  end
end