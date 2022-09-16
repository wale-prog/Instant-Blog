require 'rails_helper'

RSpec.describe User, type: :model do
 
  describe 'Tests for User class validation' do 
    before(:each) do 
      @user = User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    end

    it 'user should return invalid when name = nil' do
      @user.name = nil
      expect(@user.save).to eq(false)
    end

    it 'user should return invalid when posts_counter is negative' do
      @user.posts_counter = -2
      expect(@user.save).to eq(false)
    end

    it 'user should return invalid when posts_counter is non integer' do
      @user.posts_counter = 3.5
      expect(@user.save).to eq(false)
    end

    it 'user should return valid when photo = nil or bio = nil' do
      @user.photo = nil
      @user.bio = nil
      @user.posts_counter = 2
      expect(@user.save).to eq(true)
    end   

  end

  describe '#User' do 
    it 'Should display the last three posts' do
      @user.save
      expect(@user.recent_three_posts.length).to eq(@user.posts.order('created_at').last(3).count)
    end
  end
  
end