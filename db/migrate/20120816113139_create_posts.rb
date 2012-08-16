class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.integer :type
      t.references :group

      t.timestamps
    end
    add_index :posts, :group_id
  end
end
