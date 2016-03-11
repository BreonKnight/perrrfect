class GamesController < ApplicationController
  def index
    @games = Game.all
    render :index
  end

  def new
    @game = Game.new
    render :new
  end

  def create
    @game = Game.create(game_params)
    if @game.save
      flash[:notice] = "New Game has been added"
      redirect_to games_path
    else
      flash[:error] = @game.errors.full_messages.join(', ')
      redirect_to new_game_path
    end
  end

  def show
    game_id = params[:id]
    @game = Game.find_by_title(game_id)
    render :show
  end

  def edit
    game_id = params[:id]
    @game = Game.find_by_title(game_id)
  end

  def update
    game = params[:id]
    game = Game.find_by_title(game)
    game_edit_params = params.require(:game).permit(:title, :avatar)
    game.update_attributes(game_edit_params)
    redirect_to games_path(game)
  end

  private

    def game_params
      params.require(:game).permit(:title, :avatar)
    end

end
