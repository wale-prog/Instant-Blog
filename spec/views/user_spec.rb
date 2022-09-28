require 'rails_helper'

RSpec.describe User, type: :feature do  
  before(:each) do
    @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @user1.posts.create(title: 'This is my first post', text: 'This is the content of my first post')
    @user1.posts.create(title: 'This is my second post', text: 'This is the content of my second post')
    @user2 = User.create(name: 'Lilly', photo:'https://unsplash.com/photos/F_-0BxGuVvo1', bio: 'Teacher from Poland')
    @user2.posts.create(title: 'This is my first post', text: 'This is the content of my first post')
  end
  describe 'index page' do
    it 'should show user\'s name' do
      visit users_path
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end
    it 'should show user\'s photo' do
      visit users_path
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo1']")
    end
    it 'should display user\'s post number' do
      visit users_path
      expect(page).to have_content('number of posts: 1')
    end
    it 'should redirect to user\'s show page when user is clicked ' do
      visit users_path
      click_link('Tom')
      expect(current_path).to eq(user_path(@user1.id))
    end
  end
  describe 'show page' do
    it 'should show user\'s photo' do
      visit user_path(@user1.id)
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
    end
    it 'should show user\'s name' do
      visit user_path(@user1.id)
      expect(page).to have_content('Tom')
    end    
    it 'should show user\'s bio' do
      visit user_path(@user1.id)
      expect(page).to have_content('Teacher from Mexico.')
    end
    it 'should show user\'s posts' do
      visit user_path(@user1.id)
      expect(page).to have_content('This is the content of my first post')
      expect(page).to have_content('This is the content of my second post')
    end
    it 'should see a button to view all user\'s posts' do
      visit user_path(@user1.id)
      expect(page).to have_link("See all posts by #{@user1.name}")
    end

    it 'should redirect to posts show page when user\'s post is clicked' do
      visit user_posts_path(@user1.id)
      click_link('This is my first post')
      expect(current_path).to eq("/users/#{@user1.id}/posts/#{@user1.posts.first.id}")
    end

    it 'should redirect to user\'s posts page when button is clicked' do
      visit user_path(@user1.id)
      click_link("See all posts by Tom")
      expect(current_path).to eq(user_posts_path(@user1.id))
    end
  end
end
