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
    char_params = params.require(:character).permit(:name)
    @character = Character.create(char_params)
    if @character.save
      @game.characters << @character
      flash[:notice] = "New Game has been added"
      redirect_to @character
    else
      flash[:error] = @character.errors.full_messages.join(', ')
      redirect_to new_game_character
    end
  end
end
