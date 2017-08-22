class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def index
    if params[:search]
      arr = []
      Player.all.each do |p|
        if p.name == params[:search]
          arr << p
        end
        @players = arr
      end
    else
      @players = Player.all
  end
end

  def create
    @player = Player.new(player_params)
    if @player.valid?
      @player.save
      redirect_to players_path    #might want to redirect to User_Team_path
    else
      render :new
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  private

  def player_params
    params.require(:player).permit(:name,:shooting,:passing,:defense,:foul,:dribbling)
  end

end
