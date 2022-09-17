require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do 
    @author = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @post = Post.create(title: 'Rails rock', text: 'Rails presents the best developer\'s tools', author_id: @author.id)
    @like = Like.create(author_id: @author.id, post_id: @post.id)
  end
  describe '#Like' do 
   
    it 'like object should be valid' do      
      expect(@like).to be_valid
    end

    context 'custom methods' do
      it 'Should update the likes' do
        expect(@like.update_like_counter).to eq(@post.update(likes_counter: @post.likes.count))
      end
    end

  end
  
end