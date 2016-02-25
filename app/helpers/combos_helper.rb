module CombosHelper
  def char_combos(character)
    User.last.combos.where(character_id: character)
  end
end
