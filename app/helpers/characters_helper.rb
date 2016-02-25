module CharactersHelper
  def char_game?(character)
    game_title = Character.find(character.id)
  end
end
