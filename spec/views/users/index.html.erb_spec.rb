require 'rails_helper'

user = FactoryBot.create( :user )

RSpec.describe 'users/index.html.erb', type: :feature do
  scenario 'display all usernames' do
    visit '/'
    expect(page).to have_content(user.name)
  end

  scenario 'display user profile picture' do
    visit '/'
    expect(page).to have_css("img[src='#{user.photo}']")
  end

  scenario 'display number of posts for each user' do
    visit '/'
    expect(page).to have_content(user.post_counter)
  end

  scenario "when clicked redirect to user's show page" do
    visit '/'
    click_link(href: user_path(user))
    expect(page).to have_content('Tom')
  end
end
