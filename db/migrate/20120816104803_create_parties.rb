class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :body
      t.date :date
      t.string :time
      t.string :place
      t.string :attendrate
      t.string :todorate
      t.references :group

      t.timestamps
    end
    add_index :parties, :group_id
  end
end
