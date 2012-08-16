class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :goal
      t.string :subject
      t.string :place
      t.integer :people
      t.string :name
      t.string :rule
      t.text :introduce

      t.timestamps
    end
  end
end
