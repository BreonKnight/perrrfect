class AddCharacterToCombos < ActiveRecord::Migration
  def change
    add_reference :combos, :character, index: true, foreign_key: true
  end
end
