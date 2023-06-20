require 'rails_helper'

post = FactoryBot.create(:post_with_comments)

RSpec.describe 'posts/index.html.erb', type: :feature do
  scenario 'display user profile picture' do
    visit user_posts_path(post.author)
    expect(page).to have_css("img[src='#{post.author.photo}']")
  end

  scenario 'display username' do
    visit user_posts_path(post.author)
    expect(page).to have_content(post.author.name)
  end

  scenario 'display number of posts' do
    visit user_posts_path(post.author)
    expect(page).to have_content(post.author.post_counter)
  end

  scenario 'display post title' do
    visit user_posts_path(post.author)
    expect(page).to have_content(post.title)
  end

  scenario 'display post text' do
    visit user_posts_path(post.author)
    expect(page).to have_content(post.text)
  end

  scenario 'display post first comment' do
    comment = post.comments.first

    visit user_posts_path(post.author)
    expect(page).to have_content(comment.text)
  end

  scenario 'display number of comments' do
    visit user_posts_path(post.author)
    expect(page).to have_content(post.comments_counter)
  end

  scenario 'display number of likes' do
    visit user_posts_path(post.author)
    expect(page).to have_content(post.likes_counter)
  end

  scenario 'when clicked redirects to post show page' do
    visit user_posts_path(post.author)
    click_link(href: user_post_path(post.author, post))
    expect(page).to have_content(post.author.name)
  end
end
