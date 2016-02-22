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
    @game = Game.find(params[:game_id])
    @character = @game.characters.build(char_params)
    if @character.save
      flash[:notice] = "New Game has been added"
      redirect_to @character
    else
      flash[:error] = @character.errors.full_messages.join(', ')
      redirect_to new_game_character
    end
  end

  private
    def char_params
      params.require(:character).permit(:name)
    end
end
