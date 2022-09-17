class Post < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  # Validation
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_five_comments
    comments.order('created_at').last(5)
  end
end
