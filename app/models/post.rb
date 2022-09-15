class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: 'post_id'
  has_many :likes

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_five_comments
    comments.order('created_at').last(5)
  end
end

# A method that updates the posts counter for a user.
# A method which returns the 5 most recent comments for a given post.
