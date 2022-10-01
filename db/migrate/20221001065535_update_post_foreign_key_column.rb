class UpdatePostForeignKeyColumn < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :comments, :posts
    remove_foreign_key :likes, :posts
    add_foreign_key :comments, :posts, on_delete: :cascade
    add_foreign_key :likes, :posts, on_delete: :cascade
   end
end
