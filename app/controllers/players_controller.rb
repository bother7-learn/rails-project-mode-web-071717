class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def index
    @players = Player.all
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

end
