class Post < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  after_initialize :init

  # Validation
  validates_presence_of :title, :text
  validates :title, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_five_comments
    comments.includes(:author).order('created_at').last(5)
  end

  def init
    self.comments_counter ||= 0
    self.likes_counter ||= 0
    true
  end
end
