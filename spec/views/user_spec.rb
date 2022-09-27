require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'User' do
    before(:each) do
      @user = User.create(
        name: 'Tom',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.'
      )
    end

    it 'should be valid' do
      expect(@user).to be_valid
    end

    it 'should have a name' do
      expect(@user.name).to eq('Tom')
    end

    it 'should have a photo' do
      expect(@user.photo).to eq('https://unsplash.com/photos/F_-0BxGuVvo')
    end

    it 'should have a bio' do
      expect(@user.bio).to eq('Teacher from Mexico.')
    end
  end
end
