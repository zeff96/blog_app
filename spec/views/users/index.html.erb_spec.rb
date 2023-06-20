require 'rails_helper'

user1 = FactoryBot.create(:user)
user2 = FactoryBot.create(:user)

RSpec.describe 'users/index.html.erb', type: :feature do
  scenario 'display all usernames' do
    visit '/'
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end

  scenario 'display user profile picture' do
    visit '/'
    expect(page).to have_css("img[src='#{user1.photo}']")
    expect(page).to have_css("img[src='#{user2.photo}']")
  end

  scenario 'display number of posts for each user' do
    visit '/'
    expect(page).to have_content(user1.post_counter)
    expect(page).to have_content(user2.post_counter)
  end

  scenario "when clicked redirect to user's show page" do
    visit '/'
    click_link(href: user_path(user1))
    expect(page).to have_content(user1.name)
    visit '/'
    click_link(href: user_path(user2))
    expect(page).to have_content(user2.name)
  end
end
