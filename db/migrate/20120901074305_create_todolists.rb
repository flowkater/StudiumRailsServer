class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.string :list
      t.references :party

      t.timestamps
    end
  end
end
