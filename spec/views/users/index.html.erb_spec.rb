require 'rails_helper'

user = FactoryBot.create( :user )

RSpec.describe 'users/index.html.erb', type: :feature do
  scenario 'display all usernames' do
    visit '/'
    expect(page).to have_content(user.name)
  end
end
