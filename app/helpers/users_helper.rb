module UsersHelper
  def user_combo_count(user)
    Combo.where(user_id: user.id).count
  end

  def users_combos(user)
    Combo.where(user_id: user.id)
  end

  def combo_comma_remover(user)
    combos = Combo.where(user_id: user.id)
    combos.each do |combo|
      combo.move.split(',')
    end
  end

  def combo_character(gameid)
      Character.find_by_id(gameid).name
  end

end
