class GamesController < ApplicationController
  def index
    @games = Game.all
    render :index
  end

  def new
    @games = Game.new
    render :new
  end

  def create
    @game = Game.create(game_params)
    if @game.save
      flash[:notice] = "New Game has been added"
      redirect_to @game
    else
      flash[:error] = @game.errors.full_messages.join(', ')
      redirect_to new_game_path
    end
  end

  def show
    game_id = params[:id]
    @game = find_by_title(game_id)
    render :show
  end

  def edit

  end

  def update

  end

  private

    def game_params
      params.require(:user).permit(:title, :avatar )
    end

end
