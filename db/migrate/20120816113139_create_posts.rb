class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.integer :posttype
      t.references :group
      t.integer :user_id

      t.timestamps
    end
    add_index :posts, :group_id
    add_index :posts, :user_id
  end
end
