class AddCombosToUser < ActiveRecord::Migration
  def change
    add_reference :users, :combo, index: true, foreign_key: true
  end
end
