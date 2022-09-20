require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(title: 'title', text: 'Some text', author_id: @author.id)
    @comment = Comment.create(text: 'Some comments', author_id: @author.id, post_id: @post.id)
  end

  it 'Should be valid comment object' do
    expect(@comment).to be_valid
  end

  context 'Custom method' do
    it 'Should update the comments on the post' do
      expect(@comment.update_comments_counter).to eq(@post.update(comments_counter: @post.comments.count))
    end
  end
end
