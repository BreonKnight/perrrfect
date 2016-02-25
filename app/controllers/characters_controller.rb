class CharactersController < ApplicationController

  def index
    @characters = Character.all
    render :index
  end

  def new
    @character = Character.new
    render :new
  end

  def create
    title = params[:game_id]
    @game = Game.find_by(title: title)
    char_params = params.require(:character).permit(:name, :avatar)
    @character = Character.create(char_params)
    if @character.save
      @game.characters << @character
      flash[:notice] = "New Game has been added"
      redirect_to game_character_path(@character)
    else
      flash[:error] = @character.errors.full_messages.join(', ')
      redirect_to new_game_character
    end
  end

  def show
    #/games/:game_id/characters/:id
    title = params[:game_id]
    name = params[:id]
    @character = Game.find_by(title: title).characters.find_by_name(name)
    render :show
  end

  def edit
    title = params[:game_id]
    name = params[:id]
    @character = Game.find_by(title: title).characters.find_by_name(name)
    render :edit
  end

  def update
    title = params[:game_id]
    name = params[:id]
    character = Game.find_by(title: title).characters.find_by_name(name)
    char_edit_params = params.require(:character).permit(:name, :avatar)
    character.update_attributes(char_edit_params)
    redirect_to game_character_path
  end

end
