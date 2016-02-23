class CreateCombos < ActiveRecord::Migration
  def change
    create_table :combos do |t|
      t.string :combo_name
      t.string :move

      t.timestamps null: false
    end
  end
end
