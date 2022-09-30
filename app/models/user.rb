class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # Associations
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  after_initialize :init

  # Validations
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Actions
  def recent_three_posts
    posts.order('created_at').last(3)
  end

  def init
    self.posts_counter ||= 0
    true
  end
end
