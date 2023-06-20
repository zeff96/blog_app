require 'rails_helper'

post = FactoryBot.create(:post_with_comments)
comment = FactoryBot.create(:comment)

RSpec.describe 'posts/show.html.erb', type: :feature do
  scenario 'display post title' do
    visit user_post_path(post.author, post)
    expect(page).to have_content(post.title)
  end

  scenario 'display post author' do
    visit user_post_path(post.author, post)
    expect(page).to have_content(post.author.name)
  end

  scenario 'display number of comments' do
    visit user_post_path(post.author, post)
    expect(page).to have_content(post.comments_counter)
  end

  scenario 'display number of likes' do
    visit user_post_path(post.author, post)
    expect(page).to have_content(post.likes_counter)
  end

  scenario 'display post text' do
    visit user_post_path(post.author, post)
    expect(page).to have_content(post.text)
  end

  scenario 'display username of each commenter' do
    visit user_posts_path(post.author, post)
    expect(page).to have_content(comment.author.name)
  end

  scenario 'display username of each commenter' do
    visit user_posts_path(post.author, post)
    post.comments.each do |post_comment|
      expect(page).to have_content("#{post_comment.author.name}: #{post_comment.text}")
    end
  end
end
