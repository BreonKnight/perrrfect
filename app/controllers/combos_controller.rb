class CombosController < ApplicationController
  def index
    @combos = Combo.all
  end

  def new
    @combo = Combo.new
    render :new
  end

  def show
    title = params[:game_id]
    name = params[:character_id]
    the_combo = params[:id]
    @combo = Game.find_by(title: title).characters.find_by_name(name).combos.find_by_id(the_combo)
    render :show
  end

  def create
    title = params[:game_id]
    name = params[:character_id]
    #Game.first.characters.first.combos
    @character = Game.find_by(title: title).characters.find_by_name(name)
    combo_params = params.require(:combo).permit(:combo_name, :move).merge(user_id: current_user.id)
    @combo = Combo.create(combo_params)
    if @combo.save
      @character.combos << @combo
      flash[:notice] = "You've added a new Combo!"
      redirect_to game_character_combos_path
    else
      flash[:error] = @combos.errors.full_messages.join(', ')
      redirect_to new_game_character_combo
    end
  end

  def edit
    title = params[:game_id]
    name = params[:character_id]
    the_combo = params[:id]
    @combo = Game.find_by(title: title).characters.find_by_name(name).combos.find_by_id(the_combo)
    render :show
  end

  def update
    title = params[:game_id]
    name = params[:character_id]
    the_combo = params[:id]
    combo = Game.find_by(title: title).characters.find_by_name(name).combos.find_by_id(the_combo)
    combo_params = params.require(:combo).permit(:combo_name, :move)
    combo.update_attributes(combo_params)
    redirect_to game_character_combo_path
  end


end
