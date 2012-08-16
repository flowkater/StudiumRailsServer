class CreatePartymessages < ActiveRecord::Migration
  def change
    create_table :partymessages do |t|
      t.string :body
      t.references :group

      t.timestamps
    end
    add_index :partymessages, :group_id
  end
end
