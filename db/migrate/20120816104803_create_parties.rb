class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :body
      t.date :date
      t.time :starttime
      t.time :endtime
      t.string :place
      t.references :group

      t.timestamps
    end
    add_index :parties, :group_id
  end
end
