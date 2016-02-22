class AddAvatarColumnsToCharacters < ActiveRecord::Migration
  def up
    add_attachment :characters, :avatar
  end

  def down
    remove_attachment :characters, :avatar
  end
end
