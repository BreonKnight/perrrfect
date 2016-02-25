class AddUserIdToCombos < ActiveRecord::Migration
  def change
    add_reference :combos, :user, index: true, foreign_key: true
  end
end
