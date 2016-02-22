class AddAvatarColumnsToGames < ActiveRecord::Migration
  def up
    add_attachment :games, :avatar
  end

  def down
    remove_attachment :games, :avatar
  end
end
