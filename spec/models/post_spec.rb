require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @author = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @post = Post.create(title: 'Rails rock', text: 'Rails presents the best developer\'s tools', author_id: @author.id)
  end

  describe 'Tests for User class validation' do
    it 'post should return invalid when post.title = nil' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'post should return invalid when title character exceeds 250' do
      @post.title = 'a' * 251
      expect(@post.save).to eq(false)
      p @post.id
    end

    it 'post should return invalid when comments_counter is non positive' do
      @post.comments_counter = -2
      expect(@post.save).to eq(false)
    end

    it 'post should return invalid when comments_counter is non positive' do
      @post.likes_counter = -2
      expect(@post.save).to eq(false)
    end
  end

  describe '#recent_five_comments' do
    it 'something' do
      expect(@post.recent_five_comments.count).to eq(@post.comments.order('created_at').last(5).count)
    end
  end
end
