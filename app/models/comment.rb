class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id', optional: true

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
