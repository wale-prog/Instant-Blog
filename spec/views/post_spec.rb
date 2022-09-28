require 'rails_helper'

RSpec.describe Post, type: :feature do  
  before(:each) do
    @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = @user1.posts.create(title: 'This is my first post', text: 'This is the content of my first post')    
    @user1.posts.create(title: 'This is my second post', text: 'This is the content of my second post')
    @user2 = User.create(name: 'Lilly', photo:'https://unsplash.com/photos/F_-0BxGuVvo1', bio: 'Teacher from Poland')
    @user2.posts.create(title: 'This is my first post', text: 'This is the content of my first post')
    @post.comments.create(text: 'This is the first comment', author_id: @user2.id)
  end

  describe 'post show page' do
    it 'should show user\'s photo' do
      visit user_posts_path(@user1.id)
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'should show user\'s name' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content('Tom')
    end

    it 'should see the number of posts by the user' do 
      visit user_posts_path(@user1.id)
      expect(page).to have_content('Number of posts: 2')
    end

    it 'should see the title of posts' do 
      visit user_posts_path(@user1.id)
      expect(page).to have_content('This is my first post')
    end

    it 'should see post\'s body' do 
      visit user_posts_path(@user1.id)
      expect(page).to have_content('This is the content of my first post')
    end

    it 'should see the first comment' do 
      visit user_posts_path(@user1.id)
      expect(page).to have_content('This is the first comment')
    end

    it 'should see the number of comments' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content('Comments: 1')
    end

    it 'should see the number of likes' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content('Likes: 0')
    end

    it 'should redirect to user\'s posts show page when a post is clicked' do
      visit user_posts_path(@user1.id)
      click_link("This is my first post")
      expect(current_path).to eq(user_post_path(@user1.id, @user1.posts.first.id))
    end
  end
  describe 'post index page' do
    it 'should show the title of the post' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content('This is my first post')
    end

    it 'should show the post author username' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content('Tom')
    end

    it 'should show the number of comments' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content('Comments: 1')
    end

    it 'should show the number of likes' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content('Likes: 0')
    end

    it 'should show the number of likes' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content('This is the content of my first post')
    end

    it 'should show the name of the commenter' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content('Lilly')
    end

    it 'should show the content of the comments' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content('This is the first comment')
    end
  end
end