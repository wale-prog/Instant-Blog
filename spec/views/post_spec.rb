RSpec.describe User, type: :feature do  
  before(:each) do
    @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @user1.posts.create(title: 'This is my first post', text: 'This is the content of my first post')
    @user1.posts.create(title: 'This is my second post', text: 'This is the content of my second post')
    @user2 = User.create(name: 'Lilly', photo:'https://unsplash.com/photos/F_-0BxGuVvo1', bio: 'Teacher from Poland')
    @user2.posts.create(title: 'This is my first post', text: 'This is the content of my first post')
  end

  describe 'post index page' do
    
  end
end