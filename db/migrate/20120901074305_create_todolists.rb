class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.string :list

      t.timestamps
    end
  end
end
